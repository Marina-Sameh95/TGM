
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/button.dart';
import 'package:tmg/constants/widget/text_field.dart';
import 'package:tmg/modules/forgetPassword/veiw/forgetPassword_screen.dart';
import 'package:tmg/modules/home/veiw/homeTabPages.dart';
import 'package:tmg/modules/login/presenter/login_provider.dart';
import 'package:tmg/modules/register/view/signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<LoginDataProvider>(
        create: (_) => LoginDataProvider(),
        child: _LoginProviderBody(),
      ),
    );
  }
}

class _LoginProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginProviderBodyState();
  }
}

class _LoginProviderBodyState extends State<_LoginProviderBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginDataProvider>(
        builder: (_, LoginDataProvider myProvider, child) {
      return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LoginPortrait()),
        onWillPop: () => MinimizeApp.minimizeApp(),
      );
    });
  }
}

class LoginPortrait extends StatefulWidget {
  @override
  _LoginPortraitState createState() => new _LoginPortraitState();
}

class _LoginPortraitState extends State<LoginPortrait> {
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Consumer<LoginDataProvider>(
        builder: (_, LoginDataProvider myProvider, child) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///login pic
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/launcher_icon.png',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ///login
                  Center(
                    child: Text("تسجيل الدخول",
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
                    controller:  myProvider.loginEmailController,
                    validatorFunction: MyTextField.validateEmail,
                  ),

                  SizedBox(height: 20),

                  ///password
                  MyTextField.getTextInputField(
                    labelText:  "كلمة المرور",
                    fontColor: MyColors.lightBlackColor,
                    keyboardType: TextInputType.visiblePassword,
                    isPasswordField:  myProvider.loginShowPassword,
                    controller:  myProvider.loginPasswordController,
                    textInputAction: TextInputAction.done,
                    suffix: IconButton(
                        icon: Icon(
                          myProvider.loginShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff30332E),
                        ),
                        onPressed: () {
                          setState(() {
                            myProvider.loginShowPassword =
                            !myProvider.loginShowPassword;
                          });
                        }),
                  ),

                  ///forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              "هل نسيت كلمة المرور؟",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontSize: 15.0,
                                color: MyColors.blueColor,
                              )),
                            )),
                      ),
                    ],
                  ),

                  ///login button
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      child: AppButton(
                        onPressed: ()async {
                        await  myProvider.loginFunc(myProvider.loginEmailController.text,
                          myProvider.loginPasswordController.text);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeTabPages()),
                              (Route<dynamic> route) => false);
                        },
                        buttonText: "تسجيل الدخول",
                      )),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب؟",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: MyColors.petroleumColor,
                                fontSize: 13.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor:Colors.transparent ,
                        hoverColor:Colors.transparent ,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "انشاء حساب",
                          style: TextStyle(
                              fontSize: 15.0, color: MyColors.blueColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
