import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:migacy_app/persentation/page/authentication/controller/sign_in_controller.dart';
import 'package:migacy_app/resources/assets_path/assets_path.dart';
import 'package:migacy_app/resources/configs/helpers/helpers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../../resources/app_constants/app_constants.dart';
import '../../../../resources/app_strings/app_strings.dart';
import '../../../../resources/app_themes/app_themes.dart';
import '../../../../resources/configs/routes/routes.dart';
import '../../../widget/auth_button.dart';
import '../../../widget/auth_edittext.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {

  SignInController controller = Get.put(SignInController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localLang = AppLocalizations.of(context)!;
    return BlocConsumer<ConnectedBloc, ConnectedState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return GetBuilder<SignInController>(builder: (_) {
            return Scaffold(
              body: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    physics: const PageScrollPhysics(),
                    child: SizedBox(
                      height: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            localLang.signInUsing,
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
                            textEditingController: controller.emailMobileEditingController,
                          ),
                          const SizedBox(height: 25),
                          AuthEditText(
                            width: 90.w,
                            hintText: localLang.placeHolderPassword,
                            maxLength: 30,
                            type: TextInputType.text,
                            isPassword: true,
                            textEditingController: controller.passwordEditingController,
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              localLang.forgotPassword,
                              style: AppConstants.normalTextStyle(
                                  13.sp, AppThemes.lightGrayTextColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      //Open register screen
                                      Get.toNamed(Routes.registerScreen);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          localLang.newUserCan,
                                          style: AppConstants.normalTextStyle(
                                              13.sp, AppThemes.lightGrayTextColor),
                                        ),
                                        Text(
                                          localLang.signUp,
                                          style: AppConstants.normalTextStyle(
                                              13.sp, AppThemes.dotColor),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
                                  SizedBox(height: 2.5.h),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.0.h),
                                    child: AuthButton(
                                      press: () {
                                        //validation check
                                        var textOfEmailMobileValue = controller.emailMobileEditingController.text.toString();
                                        if(textOfEmailMobileValue.isEmpty){
                                          Helpers.showSnackBar(context, localLang.errorEmailMobileEmptyMessage);
                                          return;
                                        }else if(!Helpers.isEmail(textOfEmailMobileValue) && !Helpers.isPhone(textOfEmailMobileValue)){
                                          Helpers.showSnackBar(context, localLang.errorEmailMobileNotValidMessage);
                                          return;
                                        }
                                        var textOfPasswordValue = controller.passwordEditingController.text.toString();
                                        if(textOfPasswordValue.isEmpty){
                                          Helpers.showSnackBar(context, localLang.errorPasswordEmptyMessage);
                                          return;
                                        }
                                      },
                                      text: AppStrings.strSignIn,
                                      color: 0xff000000,
                                      //icon: AssetsPath.rightArrow,
                                      iconColor: Colors.white,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
