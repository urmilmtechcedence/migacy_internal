import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:migacy_app/resources/configs/routes/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import '../../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../../resources/app_constants/app_constants.dart';
import '../../../../resources/app_themes/app_themes.dart';
import '../../../../resources/assets_path/assets_path.dart';
import '../../../../resources/configs/helpers/helpers.dart';
import '../../../widget/auth_button.dart';
import '../controller/otp_verifiy_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => OtpVerificationState();
}

class OtpVerificationState extends State<OtpVerificationScreen> {
  final int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  OtpVerifyController controller =
      Get.put(OtpVerifyController(), permanent: true);
  var routes = {};

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      if (mounted) {
        setState(() {
          _otpCode = SmsVerification.getCode(message, intRegex);
          controller.textEditingController.text = _otpCode;
          _onOtpCallBack(_otpCode, true);
        });
      }
    });
  }

  _onSubmitOtp() {
    if (mounted) {
      setState(() {
        _isLoadingButton = !_isLoadingButton;
        _verifyOtpCode();
      });
    }
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    if (mounted) {
      setState(() {
        _otpCode = otpCode;
        if (otpCode.length == _otpCodeLength && isAutofill) {
          _enableButton = false;
          _isLoadingButton = true;
          _verifyOtpCode();
        } else if (otpCode.length == _otpCodeLength && !isAutofill) {
          _enableButton = true;
          _isLoadingButton = false;
        } else {
          _enableButton = false;
        }
      });
    }
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(FocusNode());
    Timer(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _isLoadingButton = false;
          _enableButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localLang = AppLocalizations.of(context)!;
    routes = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GetBuilder<OtpVerifyController>(
            initState: (_) {},
            builder: (_) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                  key: _scaffoldKey,
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 13.h),
                          child: Column(
                            children: [
                              Image.asset(
                                AssetsPath.appThemeLogo,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                localLang.enterOtpFromMessage,
                                style: AppConstants.normalTextStyle(
                                    11.sp, AppThemes.lightGrayTextColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldPin(
                                  textController:
                                      controller.textEditingController,
                                  autoFocus: true,
                                  codeLength: _otpCodeLength,
                                  alignment: MainAxisAlignment.center,
                                  defaultBoxSize: 46.0,
                                  margin: 10,
                                  selectedBoxSize: 46.0,
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppThemes.lightGrayTextColor),
                                  defaultDecoration: controller.pinPutDecoration
                                      .copyWith(
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.6))),
                                  selectedDecoration:
                                      controller.pinPutDecoration,
                                  onChange: (code) {
                                    _onOtpCallBack(code, false);
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Positioned(
                          bottom: 5.h,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    localLang.otpSentCheckMessage,
                                    style: AppConstants.normalTextStyle(
                                        11.sp, AppThemes.dotColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.5.h),
                              AuthButton(
                                press: () async {
                                  if (_otpCode.length != 4) {
                                    Helpers.showSnackBar(context, localLang.errorOtpIsEmpty);
                                    return;
                                  }
                                  Get.offNamed(Routes.createPasswordScreen);
                                },
                                text: localLang.register,
                                color: 0xff9AD4FF,
                                icon: AssetsPath.icNext,
                                iconColor: AppThemes.lightBlueTextColor,
                                textColor: AppThemes.lightBlueTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
