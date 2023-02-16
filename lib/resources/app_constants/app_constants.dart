import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:migacy_app/resources/app_themes/app_themes.dart';
import 'package:sizer/sizer.dart';

class AppConstants {
  static String fontFamily = "Montserrat";

  // for dio
  static const CONNECT_TIMEOUT = 1000;
  static const RECEIVE_TIMEOUT = 1000;

  static const DEFAULT_EMAIL = "contact@sprut.ua";
  static const DEFAULT_PHONE = "9900";

  static TextStyle? normalTextStyle(double? fontSize, Color textColor) =>
      TextStyle(
        color: textColor,
        fontFamily: AppConstants.fontFamily,
        fontSize: fontSize,
      );
}
