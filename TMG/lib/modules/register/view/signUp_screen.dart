
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'as intl;
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/button.dart';
import 'package:tmg/constants/widget/text_field.dart';
import 'package:tmg/modules/login/veiw/login_screen.dart';
import 'package:tmg/modules/register/presenter/signUp_provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<SignUpProvider>(
        create: (_) => SignUpProvider(),
        child: _SignUpProviderBody(),
      ),
    );
  }
}

class _SignUpProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpProviderBodyState();
  }
}

class _SignUpProviderBodyState extends State<_SignUpProviderBody> {
  DateTime selectedDate;
  var outputFormat = intl.DateFormat('dd-MM-yyyy');

  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime picked = await DatePicker.showSimpleDatePicker(
      context,
      firstDate: DateTime(1940),
      lastDate: DateTime.now().add(Duration(days: 365)),
      dateFormat: ('dd-MM-yyyy'),
      locale: DateTimePickerLocale.de,
      looping: true,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        SignUpProvider.birthDate = outputFormat.format(picked);
      });
  }

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
        builder: (_, SignUpProvider myProvider, child) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 15,right: 15),
                    child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor:Colors.transparent ,
                        hoverColor:Colors.transparent ,
                        onTap:() {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                           'assets/images/back icon.gif',
                          height: 25,
                          width: 25,
                          color: MyColors.primaryColor,
                        )),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formGlobalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text( "انشاء حساب",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            ///fullName
                            MyTextField.getTextInputField(
                              labelText:"الاسم بالكامل",
                              fontColor: MyColors.mediumGreyColor,
                              keyboardType: TextInputType.text,
                              isPasswordField: false,
                              controller: myProvider.fullNameController,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z ]')),
                              ],
                              validatorFunction: (value) {
                                if (value == null || value == '') {
                                  return  "لا يمكن أن يكون هذا الحقل فارغًا";
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            ///date
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( "تاريخ ميلادك",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text( "يرجى تحديد تاريخ ميلادك",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: MyColors.mediumGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    // textDirection: getTextDirection(context),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  ///calender
                                  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.textFieldBackground,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                          border: Border.all(
                                              width: 2,
                                              color: MyColors.textFieldBackground)),
                                      child: new TextFormField(
                                        controller:
                                        myProvider.birthDateController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: new InputDecoration(
                                          suffixIcon: IconButton(
                                              icon: Image.asset(
                                                'assets/images/calender.png',
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.fill,
                                              ),
                                              onPressed: () {
                                                selectBirthDate(context);
                                              }),
                                          hintText: SignUpProvider.birthDate == null
                                              ? 'DD/MM/YYYY'
                                              : SignUpProvider.birthDate.toString(),
                                          contentPadding: EdgeInsets.all(10.0),
                                          hintStyle: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                              color: MyColors.mediumGreyColor,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            ///Gender
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   "النوع",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                     "يرجى تحديد نوعك",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: MyColors.mediumGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width / 3.7,
                                    child: Row(children: [
                                      ///Male
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            myProvider.isMale = true;
                                            myProvider.isFemale = false;
                                            myProvider.gender = 'Male';
                                          });
                                        },
                                        child: Container(
                                          width: 130,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: myProvider.gender ==
                                                      'Male'
                                                      ? Colors.black
                                                      : Colors.white70,
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            elevation: 1.5,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                   "ذكر",
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/images/male.png',
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),

                                      ///Female
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            myProvider.isMale = false;
                                            myProvider.isFemale = true;
                                            myProvider.gender = 'Female';
                                          });
                                        },
                                        child: Container(
                                          width: 130,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: myProvider.gender ==
                                                      'Female'
                                                      ? Colors.black
                                                      : Colors.white70,
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            elevation: 1.5,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10),
                                                  child: Text( "انثي",
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/images/female.png',
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            ///Address
                            MyTextField.getTextInputField(
                              labelText: "ادخل العنوان كاملاً",
                              fontColor: MyColors.mediumGreyColor,
                              keyboardType: TextInputType.text,
                              isPasswordField: false,
                              controller: myProvider.addressController,
                              suffix: IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: MyColors.mediumGreyColor,
                                ),
                              ),
                              validatorFunction: (value) {
                                if (value == null || value == '') {
                                  return  "لا يمكن أن يكون هذا الحقل فارغًا";
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            ///ValidEmail
                            MyTextField.getTextInputField(
                              labelText:  "بريد إلكتروني",
                              fontColor: MyColors.mediumGreyColor,
                              keyboardType: TextInputType.text,
                              isPasswordField: false,
                              controller: myProvider.emailController,
                              validatorFunction: MyTextField.validateEmail,
                            ),
                                // : SizedBox(),
                            SizedBox(
                              height: 15,
                            ),

                            ///MobileNumber
                            MyTextField.getTextInputField(
                              labelText:  "اكتب رقم الهاتف باللغة الإنجليزية",
                              fontColor: MyColors.mediumGreyColor,
                              keyboardType: TextInputType.number,
                              isPasswordField: false,
                              controller: myProvider.mobileController,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            ///Password
                            MyTextField.getTextInputField(
                              labelText:  "كلمة المرور",
                              fontColor: MyColors.lightBlackColor,
                              keyboardType: TextInputType.visiblePassword,
                              isPasswordField:  myProvider.signUptShowPassword,
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
                                    myProvider.signUptShowPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xff30332E),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      myProvider.signUptShowPassword =
                                      !myProvider.signUptShowPassword;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  Text( "8 أحرف على الأقل",
                                                      style: TextStyle(
                                                          color: (myProvider
                                                                  .validCounter)
                                                              ? MyColors.greenColor
                                                              : MyColors
                                                                  .mediumGreyColor,
                                                          fontSize: 13))
                                                ])),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  Text( "حروف انجليزية",
                                                      style: TextStyle(
                                                          color: (myProvider
                                                                  .validUpperCase)
                                                              ? MyColors.greenColor
                                                              : MyColors
                                                                  .mediumGreyColor,
                                                          fontSize: 13))
                                                ])),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(

                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      (myProvider
                                                              .validSpecialCharacterCase)
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
                                                      Text( "حرف خاص ! @ # & * ^",
                                                        style: TextStyle(
                                                            color: (myProvider
                                                                    .validSpecialCharacterCase)
                                                                ? MyColors
                                                                    .greenColor
                                                                : MyColors
                                                                    .mediumGreyColor,
                                                            fontSize: 13),
                                                      )
                                                    ])),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  Text( "ارقام",
                                                      style: TextStyle(
                                                          color: (myProvider
                                                                  .validNumbers)
                                                              ? MyColors.greenColor
                                                              : MyColors
                                                                  .mediumGreyColor,
                                                          fontSize: 13))
                                                ])),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                // : SizedBox(),
                            SizedBox(
                              height: 15,
                            ),

                            ///ConfirmPassword
                            MyTextField.getTextInputField(
                              labelText:  "تأكيد كلمة المرور",
                              fontColor: MyColors.lightBlackColor,
                              keyboardType: TextInputType.visiblePassword,
                              isPasswordField:  myProvider.signUpShowConfirmPassword,
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
                                    myProvider.signUpShowConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xff30332E),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      myProvider.signUpShowConfirmPassword =
                                      !myProvider.signUpShowConfirmPassword;
                                    });
                                  }),
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            ///ContinueButton
                            Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: AppButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LoginScreen()));
                                      },
                                      buttonText: "استمرار",
                                    )),
                            SizedBox(
                              height: 15,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( "لديك حساب بالفعل؟",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text( "تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: MyColors.blueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
