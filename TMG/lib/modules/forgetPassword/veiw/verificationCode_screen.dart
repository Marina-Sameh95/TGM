
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/button.dart';
import 'package:tmg/modules/forgetPassword/presenter/forgetPassword_provider.dart';
import 'package:tmg/modules/forgetPassword/veiw/changePassword_screen.dart';

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<ForgetPasswordProvider>(
        create: (_) => ForgetPasswordProvider(),
        child: _VerificationCodeProviderBody(),
      ),
    );
  }
}

class _VerificationCodeProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerificationCodeProviderBodyState();
  }
}

class _VerificationCodeProviderBodyState
    extends State<_VerificationCodeProviderBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
        builder: (_, ForgetPasswordProvider myProvider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(child: VerificationCodePortrait()));
    });
  }
}

class VerificationCodePortrait extends StatefulWidget {
  @override
  _VerificationCodePortraitState createState() =>
      new _VerificationCodePortraitState();
}

class _VerificationCodePortraitState extends State<VerificationCodePortrait> {
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
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                        ///VerificationCode pic
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

                        ///VerificationCode text
                        Center(
                          child: Text("رمز التحقق",
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: MyColors.petroleumColor),
                                  fontSize: 22.0)),
                        ),
                        SizedBox(height: 20),

                        ///VerificationCode
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 55,
                                    decoration: ShapeDecoration(
                                      color: MyColors.textFieldBackground,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MyColors.textFieldBackground,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          myProvider.verificationCodeController1,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      focusNode: myProvider.focusNode1,
                                      onChanged: (value) {
                                        setState(() {
                                          myProvider.checkFocus(context);
                                        });
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        counter: Offstage(),
                                      ),
                                      textAlign: TextAlign.center,
                                      cursorColor: MyColors.primaryColor,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff0E1B4E),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 55,
                                    decoration: ShapeDecoration(
                                      color: MyColors.textFieldBackground,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MyColors.textFieldBackground,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      maxLength: 1,
                                      focusNode: myProvider.focusNode2,
                                      controller:
                                          myProvider.verificationCodeController2,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        setState(() {
                                          myProvider.checkFocus(context);
                                        });
                                      },
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        counter: Offstage(),
                                      ),
                                      textAlign: TextAlign.center,
                                      cursorColor: MyColors.primaryColor,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff0E1B4E),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 55,
                                    decoration: ShapeDecoration(
                                      color: MyColors.textFieldBackground,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MyColors.textFieldBackground,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          myProvider.verificationCodeController3,
                                      focusNode: myProvider.focusNode3,
                                      maxLength: 1,
                                      onChanged: (value) {
                                        setState(() {
                                          myProvider.checkFocus(context);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        counter: Offstage(),
                                      ),
                                      textAlign: TextAlign.center,
                                      cursorColor: MyColors.primaryColor,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff0E1B4E),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 55,
                                    decoration: ShapeDecoration(
                                      color: MyColors.textFieldBackground,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MyColors.textFieldBackground,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: TextFormField(
                                      focusNode: myProvider.focusNode4,
                                      controller:
                                          myProvider.verificationCodeController4,
                                      onChanged: (value) {
                                        setState(() {
                                          myProvider.checkFocus(context);
                                        });
                                      },
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (value) async {
                                        // myProvider.fetchVerifyCode(context);
                                      },
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        counter: Offstage(),
                                      ),
                                      textAlign: TextAlign.center,
                                      cursorColor: MyColors.primaryColor,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff0E1B4E),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                              ]),
                        ),

                        SizedBox(height: 20),

                        Center(
                          child: Text(
                              "يرجى التحقق من البريد الإلكتروني المرسل إليك\nلإكمال عملية إعادة تعيين كلمة المرور",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: MyColors.petroleumColor),
                                  fontSize: 18.0)),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              ///VerificationCode button
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: AppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));                        },
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
