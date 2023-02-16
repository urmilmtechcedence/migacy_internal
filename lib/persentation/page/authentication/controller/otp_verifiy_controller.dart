import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OtpVerifyController extends GetxController {
  TextEditingController textEditingController =  TextEditingController(text: "");


  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}
