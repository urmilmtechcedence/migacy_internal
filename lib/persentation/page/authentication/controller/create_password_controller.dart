import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../resources/configs/helpers/helpers.dart';

class CreatePasswordController extends GetxController {

  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();


  bool checkValidation(BuildContext context, AppLocalizations localLang) {
    var textOfPasswordValue = passwordEditingController.text.toString();

    if (textOfPasswordValue.isEmpty) {
      Helpers.showSnackBar(context, localLang.errorEnterPassword);
      return false;
    }
    var textOfConfirmValue = confirmPasswordEditingController.text.toString();
    if (textOfConfirmValue.isEmpty) {
      Helpers.showSnackBar(context, localLang.errorEnterConfirmPassword);
      return false;
    }

    if(textOfPasswordValue.toLowerCase().toString() != textOfConfirmValue){
      Helpers.showSnackBar(context, localLang.errorPasswordNotMatched);
      return false;
    }

    return true;
  }
}
