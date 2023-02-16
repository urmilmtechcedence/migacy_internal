import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:migacy_app/persentation/page/authentication/controller/sign_up_controller.dart';
import 'package:migacy_app/resources/assets_path/assets_path.dart';
import 'package:migacy_app/resources/configs/helpers/helpers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../../resources/app_constants/app_constants.dart';
import '../../../../resources/app_themes/app_themes.dart';
import '../../../../resources/configs/routes/routes.dart';
import '../../../widget/auth_button.dart';
import '../../../widget/auth_edittext.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController(), permanent: true);

  bool isValidation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isValidation = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localLang = AppLocalizations.of(context)!;
    return BlocConsumer<ConnectedBloc, ConnectedState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GetBuilder<SignUpController>(
            initState: (_) {},
            builder: (_) {
              return Scaffold(
                body: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.0.h),
                              child: Image.asset(
                                AssetsPath.appThemeLogo,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              localLang.signUpUsing,
                              style: AppConstants.normalTextStyle(
                                  12.sp, AppThemes.lightTextColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 1.h),
                            Container(
                              padding: const EdgeInsets.all(13),
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    AssetsPath.icFb,
                                    fit: BoxFit.fill,
                                  ),
                                  Image.asset(
                                    AssetsPath.icGm,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3.h),
                            AuthEditText(
                              width: 90.w,
                              hintText: localLang.placeHolderEmailMobile,
                              maxLength: 30,
                              format: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[a-zA-Z0-9@.]")),
                              ],
                              type: TextInputType.emailAddress,
                              textEditingController:
                                  controller.emailMobileEditingController,
                              onSaved: (text) {
                                print("Text: $text");
                                if (!Helpers.isEmail(text.toString()) &&
                                    !Helpers.isPhone(text.toString())) {
                                  isValidation = true;
                                  if (mounted) setState(() {});
                                } else {
                                  isValidation = false;
                                  if (mounted) setState(() {});
                                }
                              },
                            ),
                            const SizedBox(height: 25),
                            AuthEditText(
                              width: 90.w,
                              hintText: localLang.placeHolderDateOfBirth,
                              maxLength: 30,
                              type: TextInputType.text,
                              read: true,
                              surFixImage: AssetsPath.icCalenderToday,
                              surFixColor: AppThemes.lightGrayTextColor,
                              textEditingController:
                                  controller.calenderEditingController,
                              onTap: () async {
                                //open date picker dialog
                                var selectedDate = await Helpers.datePickerDialog(
                                    context, 'dd MMM, yyyy');
                                controller.calenderEditingController.text =
                                    selectedDate;
                              },
                              onSurFixPress: () async {
                                //open date picker dialog
                                var selectedDate = await Helpers.datePickerDialog(
                                    context, 'dd MMM, yyyy');
                                controller.calenderEditingController.text =
                                    selectedDate;
                              },
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible: isValidation,
                                      child: GestureDetector(
                                        onTap: () async {
                                          //back to auth option
                                          Get.offNamed(Routes.loginScreen);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              localLang.exitingUserCan,
                                              style: AppConstants.normalTextStyle(
                                                  13.sp,
                                                  AppThemes.lightGrayTextColor),
                                            ),
                                            Text(
                                              localLang.signIn,
                                              style: AppConstants.normalTextStyle(
                                                  13.sp, AppThemes.dotColor),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 0),
                                              child: Image.asset(
                                                AssetsPath.icNext,
                                                color: AppThemes.lightBlueTextColor,
                                                height: 20,
                                                width: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.5.h),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.0.h),
                                      child: AuthButton(
                                        press: () {
                                          //validation check
                                          if (controller.checkValidation(
                                              context, localLang)) {
                                            var object = {
                                              'from': localLang.register,
                                            };
                                            //open Otp Screen
                                            Get.toNamed(Routes.otpVerificationScreen,
                                                arguments: object);
                                          }
                                        },
                                        text: localLang.register,
                                        color: 0xff9AD4FF,
                                        icon: AssetsPath.icNext,
                                        iconColor: AppThemes.lightBlueTextColor,
                                        textColor: AppThemes.lightBlueTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
