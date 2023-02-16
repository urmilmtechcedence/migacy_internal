import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';
import 'package:migacy_app/resources/assets_path/assets_path.dart';

import '../../../../resources/app_strings/app_strings.dart';
import '../../../../resources/configs/routes/routes.dart';
import '../../../widget/auth_button.dart';

class AuthOptionScreen extends  StatefulWidget{
  const AuthOptionScreen({super.key});

  @override
  State<StatefulWidget> createState() => AuthOptionStateView();
}

class AuthOptionStateView extends State<AuthOptionScreen>{

  bool isAnimated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 1),(){
      if(mounted) {
        setState(() {
          isAnimated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsPath.authOptionBg),
              fit: BoxFit.cover,
            ),
          ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(AssetsPath.appThemeLogo),
            ),
            AnimatedPositioned(
              bottom: 39,
              left: 0,
              right: 0,
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: SafeArea(
                child: Column(
                  children: [
                    if(isAnimated)...[
                      AuthButton(
                        text: AppStrings.strSignIn,
                        press: () {
                          redirectLogin();
                        },
                        colors: true,
                        textColor: AppThemes.lightBlueTextColor,
                        color: 0xFF9AD4FF,
                        iconColor: AppThemes.lightBlueTextColor,
                        icon: AssetsPath.icNext,
                      ),
                      const SizedBox(height: 29),
                      AuthButton(
                        text: AppStrings.strSignUp,
                        press: () {
                          redirectRegister();
                        },
                        colors: true,
                        color: 0xff202A39,
                        iconColor: Colors.white,
                        icon: AssetsPath.icNext,
                      )
                    ]else...[
                      const SizedBox.shrink()
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void redirectLogin() {
    Get.offNamed(Routes.loginScreen);
  }
  void redirectRegister() {
    Get.offNamed(Routes.registerScreen);
  }
}