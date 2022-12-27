import 'package:flutter/material.dart';
import 'package:tmg/modules/login/model/request_model/login_request.dart';

class LoginDataProvider with ChangeNotifier {

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  bool loginShowPassword = true;
  bool isFetchingLogin = false;

  loginFunc(String email,String password) async {
    LoginRequest loginRequest = LoginRequest();
    isFetchingLogin = true;
    email = loginRequest.email;
    password = loginRequest.password ;
    isFetchingLogin = false;
    notifyListeners();
  }



}
