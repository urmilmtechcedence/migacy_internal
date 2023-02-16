import 'package:get/get.dart';

import '../controller/otp_verifiy_controller.dart';



class OtpVerifyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerifyController());
  }
}
