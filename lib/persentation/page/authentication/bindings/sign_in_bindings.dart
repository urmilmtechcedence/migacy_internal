import 'package:get/get.dart';
import 'package:migacy_app/persentation/page/authentication/controller/sign_in_controller.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
