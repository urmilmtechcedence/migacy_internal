import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../resources/configs/helpers/helpers.dart';

class SignUpController extends GetxController {
  TextEditingController emailMobileEditingController = TextEditingController();
  TextEditingController calenderEditingController = TextEditingController();



  void requestRegisterCall() {}

  bool checkValidation(BuildContext context, AppLocalizations localLang) {
    var textOfEmailMobileValue = emailMobileEditingController.text.toString();
    if (textOfEmailMobileValue.isEmpty) {
      Helpers.showSnackBar(context, localLang.errorEmailMobileEmptyMessage);
      return false;
    } else if (!Helpers.isEmail(textOfEmailMobileValue) &&
        !Helpers.isPhone(textOfEmailMobileValue)) {
      Helpers.showSnackBar(context, localLang.errorEmailMobileNotValidMessage);
      return false;
    }
    var textOfDateOfBirthValue = calenderEditingController.text.toString();
    if (textOfDateOfBirthValue.isEmpty) {
      Helpers.showSnackBar(context, localLang.errorChooseDateOfBirthMessage);
      return false;
    }
    return true;
  }
}
