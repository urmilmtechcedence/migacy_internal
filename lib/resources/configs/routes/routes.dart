import 'package:flutter/material.dart';
import 'package:migacy_app/persentation/page/authentication/ui/auth_option_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/create_password_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/otp_verification_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/signup_screen.dart';
import 'package:migacy_app/persentation/page/onboarding/onboarding_view.dart';
import 'package:migacy_app/persentation/page/splash_view/splash_screen.dart';

import '../../../persentation/page/authentication/ui/sigin_screen.dart';


class Routes {
  Routes._privateConstructor();

  static const String splashScreen = "/splashScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String authOptionScreen = "/authOptionScreen";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String otpVerificationScreen = "/otpVerificationScreen";
  static const String createPasswordScreen = "/createPasswordScreen";

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        splashScreen: (_) => const SplashScreen(),
        onBoardingScreen: (_) => const OnBoardingView(),
        authOptionScreen: (_) => const AuthOptionScreen(),
        loginScreen: (_) => const SignInScreen(),
        registerScreen: (_) => const SignUpScreen(),
        otpVerificationScreen: (_) => const OtpVerificationScreen(),
        createPasswordScreen: (_) => const CreatePasswordScreen(),
  };
}
