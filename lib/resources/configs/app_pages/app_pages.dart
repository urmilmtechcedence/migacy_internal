import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:migacy_app/persentation/page/authentication/bindings/create_password_bindings.dart';
import 'package:migacy_app/persentation/page/authentication/ui/create_password_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/otp_verification_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/sigin_screen.dart';
import 'package:migacy_app/persentation/page/authentication/ui/signup_screen.dart';
import 'package:migacy_app/persentation/page/onboarding/onboarding_view.dart';
import 'package:migacy_app/persentation/page/splash_view/splash_screen.dart';

import '../../../persentation/page/authentication/bindings/otp_verifiy_bindings.dart';
import '../../../persentation/page/authentication/bindings/sign_in_bindings.dart';
import '../../../persentation/page/authentication/bindings/sign_up_bindings.dart';
import '../../../persentation/page/authentication/ui/auth_option_screen.dart';
import '../routes/routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.onBoardingScreen,
      page: () => const OnBoardingView(),
    ),
    GetPage(
      name: Routes.authOptionScreen,
      page: () => const AuthOptionScreen(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => const SignInScreen(),
        binding: SignInBindings()),
    GetPage(
        name: Routes.registerScreen,
        page: () => const SignUpScreen(),
        binding: SignUpBindings()),
    GetPage(
        name: Routes.otpVerificationScreen,
        page: () => const OtpVerificationScreen(),
        binding: OtpVerifyBindings()),
    GetPage(
        name: Routes.createPasswordScreen,
        page: () => const CreatePasswordScreen(),
        binding: CreatePasswordBindings()),
  ];
}
