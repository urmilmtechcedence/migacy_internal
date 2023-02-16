import 'package:get/get.dart';

import '../controller/create_password_controller.dart';



class CreatePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePasswordController());
  }
}
