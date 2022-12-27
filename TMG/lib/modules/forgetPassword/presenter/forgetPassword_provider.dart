import 'package:flutter/material.dart';

class ForgetPasswordProvider with ChangeNotifier {
  var confirmPass;
  TextEditingController forgetEmailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  bool forgetNoFocus = false;
  bool forgetPasswordFocus = false;
  bool forgetShowPassword = true;
  bool forgetShowConfirmPassword = true;
  bool forgetPassEnableText = true;
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController verificationCodeController1 =
  new TextEditingController();
  TextEditingController verificationCodeController2 =
  new TextEditingController();
  TextEditingController verificationCodeController3 =
  new TextEditingController();
  TextEditingController verificationCodeController4 =
  new TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  checkFocus(context) {
    if (verificationCodeController3.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode4);
    } else if (verificationCodeController2.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode3);
    } else if (verificationCodeController1.text.length == 1) {
      FocusScope.of(context).requestFocus(focusNode2);
    }
  }

  bool validCounter = false;
  bool validUpperCase = false;
  bool validSpecialCharacterCase = false;
  bool validNumbers = false;
}
