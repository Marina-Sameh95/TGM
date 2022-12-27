
// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_import, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/button.dart';
import 'package:tmg/constants/widget/text_field.dart';
import 'package:tmg/modules/forgetPassword/presenter/forgetPassword_provider.dart';
import 'package:tmg/modules/login/veiw/login_screen.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPasswordProvider>(
      create: (_) => ForgetPasswordProvider(),
      child: _ChangePasswordProviderBody(),
    );
  }
}

class _ChangePasswordProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordProviderBodyState();
  }
}

class _ChangePasswordProviderBodyState
    extends State<_ChangePasswordProviderBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
        builder: (_, ForgetPasswordProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(child: ChangePasswordPortrait()));
    });
  }
}

class ChangePasswordPortrait extends StatefulWidget {
  @override
  _ChangePasswordPortraitState createState() =>
      _ChangePasswordPortraitState();
}

class _ChangePasswordPortraitState extends State<ChangePasswordPortrait> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
        builder: (_, ForgetPasswordProvider myProvider, child) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, top: 15, right: 15),
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/back icon.gif',
                                height: 25,
                                width: 25,
                                color: MyColors.primaryColor,
                              )),
                        ),

                        ///ChangePassword pic
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child: Center(
                            child: Image.asset(
                              'assets/images/changePassword.png',
                              width: 120.0,
                              height: 120.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        ///ChangePassword
                        Center(
                          child: Text("تغيير كلمة المرور",
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: MyColors.petroleumColor),
                                  fontSize: 22.0)),
                        ),
                        SizedBox(height: 20),

                        ///Password
                        MyTextField.getTextInputField(
                          labelText:  "كلمة المرور",
                          fontColor: MyColors.lightBlackColor,
                          keyboardType: TextInputType.visiblePassword,
                          isPasswordField:  myProvider.forgetShowPassword,
                          controller:  myProvider.passwordController,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            myProvider.confirmPass = value;
                            final validCounter = value.length >= 8;
                            final validUpperCase =
                            value.contains(RegExp(r'[a-zA-Z]'));
                            final validSpecialCharacterCase = value
                                .contains(RegExp(r'[\@\#\$\%\^\&\*\^\!]'));
                            final validNumbers =
                            value.contains(RegExp(r'[0-9]'));
                            setState(() {
                              if (validCounter) {
                                myProvider.validCounter = true;
                              } else {
                                myProvider.validCounter = false;
                              }
                              if (validSpecialCharacterCase) {
                                myProvider.validSpecialCharacterCase = true;
                              } else {
                                myProvider.validSpecialCharacterCase = false;
                              }
                              if (validUpperCase) {
                                myProvider.validUpperCase = true;
                              } else {
                                myProvider.validUpperCase = false;
                              }
                              if (validNumbers) {
                                myProvider.validNumbers = true;
                              } else {
                                myProvider.validNumbers = false;
                              }
                            });
                          },
                          suffix: IconButton(
                              icon: Icon(
                                myProvider.forgetShowPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xff30332E),
                              ),
                              onPressed: () {
                                setState(() {
                                  myProvider.forgetShowPassword =
                                  !myProvider.forgetShowPassword;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            (myProvider.validCounter)
                                                ? Image.asset(
                                                    'assets/images/checked.png',
                                                    height: 10,
                                                    width: 10)
                                                : Image.asset(
                                                    'assets/images/unchecked.png',
                                                    height: 10,
                                                    width: 10),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("8 أحرف على الأقل",
                                                style: TextStyle(
                                                    color: (myProvider.validCounter)
                                                        ? MyColors.greenColor
                                                        : MyColors.mediumGreyColor,
                                                    fontSize: 13))
                                          ])),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            (myProvider.validUpperCase)
                                                ? Image.asset(
                                                    'assets/images/checked.png',
                                                    height: 10,
                                                    width: 10)
                                                : Image.asset(
                                                    'assets/images/unchecked.png',
                                                    height: 10,
                                                    width: 10),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("حروف انجليزية",
                                                style: TextStyle(
                                                    color: (myProvider
                                                            .validUpperCase)
                                                        ? MyColors.greenColor
                                                        : MyColors.mediumGreyColor,
                                                    fontSize: 13))
                                          ])),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            (myProvider.validSpecialCharacterCase)
                                                ? Image.asset(
                                                    'assets/images/checked.png',
                                                    height: 10,
                                                    width: 10)
                                                : Image.asset(
                                                    'assets/images/unchecked.png',
                                                    height: 10,
                                                    width: 10),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "حرف خاص ! @ # & * ^",
                                              style: TextStyle(
                                                  color: (myProvider
                                                          .validSpecialCharacterCase)
                                                      ? MyColors.greenColor
                                                      : MyColors.mediumGreyColor,
                                                  fontSize: 13),
                                            )
                                          ])),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            (myProvider.validNumbers)
                                                ? Image.asset(
                                                    'assets/images/checked.png',
                                                    height: 10,
                                                    width: 10)
                                                : Image.asset(
                                                    'assets/images/unchecked.png',
                                                    height: 10,
                                                    width: 10),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("ارقام",
                                                style: TextStyle(
                                                    color: (myProvider.validNumbers)
                                                        ? MyColors.greenColor
                                                        : MyColors.mediumGreyColor,
                                                    fontSize: 13))
                                          ])),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),

                        ///ConfirmPassword
                        MyTextField.getTextInputField(
                          labelText:  "تأكيد كلمة المرور",
                          fontColor: MyColors.lightBlackColor,
                          keyboardType: TextInputType.visiblePassword,
                          isPasswordField:  myProvider.forgetShowConfirmPassword,
                          controller:  myProvider.confirmPasswordController,
                          textInputAction: TextInputAction.done,
                          autoValidationMode: AutovalidateMode.always,
                          validatorFunction: (value) {
                            if (value == null || value == '') {
                            } else {
                              if (value !=  myProvider.confirmPass) {
                                return "يجب أن تكون كلمة المرور هي نفسها المذكورة أعلاه";
                              }
                            }
                            return null;
                          },
                          suffix: IconButton(
                              icon: Icon(
                                myProvider.forgetShowConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xff30332E),
                              ),
                              onPressed: () {
                                setState(() {
                                  myProvider.forgetShowConfirmPassword =
                                  !myProvider.forgetShowConfirmPassword;
                                });
                              }),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              ///ForgetPassword button
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: AppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    buttonText: "تأكيد",
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      );
    });
  }
}
