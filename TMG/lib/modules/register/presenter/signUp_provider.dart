import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
   TextEditingController fullNameController = new TextEditingController();
   TextEditingController emailController = new TextEditingController();
   TextEditingController passwordController = new TextEditingController();
   TextEditingController mobileController = new TextEditingController();
   TextEditingController confirmPasswordController =
      new TextEditingController();
   TextEditingController birthDateController =
      new TextEditingController();
   TextEditingController addressController = new TextEditingController();

 var confirmPass;
  bool personalInfoIsNotRequired = false;
   bool signUptShowPassword = true;
   bool signUpShowConfirmPassword = true;
  bool validCounter = false;
  bool validUpperCase = false;
  bool validSpecialCharacterCase = false;
  bool validNumbers = false;

  bool isMale = false;
  bool isFemale = false;
   String gender;
  static String birthDate;
}
