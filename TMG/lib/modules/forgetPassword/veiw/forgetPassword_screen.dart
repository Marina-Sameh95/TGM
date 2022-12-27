
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/button.dart';
import 'package:tmg/constants/widget/text_field.dart';
import 'package:tmg/modules/forgetPassword/presenter/forgetPassword_provider.dart';
import 'package:tmg/modules/forgetPassword/veiw/verificationCode_screen.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPasswordProvider>(
      create: (_) => ForgetPasswordProvider(),
      child: _ForgetPasswordProviderBody(),
    );
  }
}

class _ForgetPasswordProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordProviderBodyState();
  }
}

class _ForgetPasswordProviderBodyState
    extends State<_ForgetPasswordProviderBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
        builder: (_, ForgetPasswordProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(child: ForgetPasswordPortrait()));
    });
  }
}

class ForgetPasswordPortrait extends StatefulWidget {
  @override
  _ForgetPasswordPortraitState createState() =>
      new _ForgetPasswordPortraitState();
}

class _ForgetPasswordPortraitState extends State<ForgetPasswordPortrait> {
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

                        ///ForgetPassword pic
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child: Center(
                            child: Image.asset(
                              'assets/images/forgetPassword.png',
                              width: 150.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        ///ForgetPassword
                        Center(
                          child: Text("نسيت كلمة المرور",
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: MyColors.petroleumColor),
                                  fontSize: 22.0)),
                        ),
                        SizedBox(height: 20),

                        ///email
                        MyTextField.getTextInputField(
                          labelText:  "بريد إلكتروني",
                          fontColor: MyColors.lightBlackColor,
                          keyboardType: TextInputType.text,
                          isPasswordField: false,
                          controller:  myProvider.forgetEmailController,
                          validatorFunction: MyTextField.validateEmail,
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              ///ForgetPassword button
              Padding(
                  padding:
                  const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: AppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationCode()));
                    },
                    buttonText: "استمرار",
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
