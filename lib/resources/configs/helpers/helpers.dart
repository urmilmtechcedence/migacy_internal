import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../app_constants/app_constants.dart';
import '../../app_themes/app_themes.dart';

class Helpers {
  Helpers._();

  static String comment = "";

  static systemStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      // Note RED here
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    ));
  }

  // static showCircularProgressDialog({required BuildContext context}) {
  //   return showDialog(
  //       barrierColor: Colors.transparent,
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           elevation: 0,
  //           backgroundColor: Colors.transparent,
  //           content: WillPopScope(
  //             onWillPop: () {
  //               return Future.value(true);
  //             },
  //             child: Center(
  //               child: Lottie.asset('assets/images/loading1.json'),
  //             ),
  //           ),
  //         );
  //       });
  // }

  // static showCustomMessageDialog(context, message) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return MyCustomDialog(
  //           message: message,
  //         );
  //       });
  // }
  //
  static showSnackBar(BuildContext context, String message) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontFamily: AppConstants.fontFamily,
          fontWeight: FontWeight.w500),
    )));
  }

  static logPrint(BuildContext context, String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  static Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static void internetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context1) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: Container(
          height: 180.0,
          width: 280.0,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please check your internet connection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppThemes.darkGrey,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context1);
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size.fromWidth(120)),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                    ),
                    child: Text(
                      "Ok",
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // static get getSecureHeaders => {
  //       "x-api-key": NetworkProviderRest.apiKey,
  //       "Content-Type": "application/json",
  //       "x-session-token":
  //           dataBaseService.getFromDisk(DatabaseKeys.sessionToken),
  //     };

  static systemStatusBar1() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent, // Note RED here
    ));
  }

  static Future<String> datePickerDialog(
      BuildContext context, String outPutFormat) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1975),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now());

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat(outPutFormat).format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16

      return formattedDate;
    } else {
      return "";
    }
  }

  //Validation Functions
  static bool isEmail(String input) =>
      RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
          .hasMatch(input);

  static bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input) &&
      input.length >= 10;
}
