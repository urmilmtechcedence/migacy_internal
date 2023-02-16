import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:migacy_app/persentation/page/authentication/controller/create_password_controller.dart';
import 'package:migacy_app/resources/assets_path/assets_path.dart';
import 'package:migacy_app/resources/configs/helpers/helpers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../business_logic/blocs/connection_bloc/connection_bloc.dart';
import '../../../../business_logic/blocs/connection_bloc/connection_state/connection_state.dart';
import '../../../../resources/app_constants/app_constants.dart';
import '../../../../resources/app_themes/app_themes.dart';
import '../../../widget/auth_button.dart';
import '../../../widget/auth_edittext.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreatePasswordScreenState();
  }
}

class CreatePasswordScreenState extends State<CreatePasswordScreen> {
  CreatePasswordController controller =
      Get.put(CreatePasswordController(), permanent: true);

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
        return GetBuilder<CreatePasswordController>(
            initState: (_) {},
            builder: (_) {
              return Scaffold(
                body: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Stack(
                      children: [
                        Positioned(child: Column(
                          children: [
                            SizedBox(height: 15.h),
                            Image.asset(
                              AssetsPath.appThemeLogo,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              localLang.createAPassword,
                              style: AppConstants.normalTextStyle(
                                  12.sp, AppThemes.lightTextColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 2.h),
                            Align(
                              alignment: Alignment.center,
                              child: AuthEditText(
                                width: 90.w,
                                hintText: localLang.placeHolderEnterPassword,
                                maxLength: 30,
                                type: TextInputType.text,
                                textEditingController:
                                controller.passwordEditingController,
                                isPassword: true,
                              ),
                            ),
                            const SizedBox(height: 25),
                            AuthEditText(
                              width: 90.w,
                              hintText: localLang.placeHolderConfirmPassword,
                              maxLength: 30,
                              type: TextInputType.text,
                              textEditingController: controller.confirmPasswordEditingController,
                              isPassword: true,
                            ),
                            SizedBox(height: 1.h),
                          ],
                        )),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AuthButton(
                                  press: () {
                                    //validation check
                                    if (controller.checkValidation(
                                        context, localLang)) {}
                                  },
                                  text: localLang.signUp,
                                  colors: true,
                                  color: 0xFF202A39,
                                  iconColor: Colors.white,
                                  icon: AssetsPath.icNext,
                                ),
                              ],
                            ),
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
