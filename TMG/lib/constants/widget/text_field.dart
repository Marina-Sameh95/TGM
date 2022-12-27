
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmg/constants/appColors.dart';
class MyTextField {
  static draw(onchange, controller, context, hint,
          {bool canArabic = false,
          bool onlyNumber = false,
            int multiLine=1,
          title,
          suffix,
          preffix,
           double borderWidth=1.0,
          double  border=6.0,
          double height = 50}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
              height: multiLine*50.0,
              child: Center(
                child: Container(
                    height: multiLine*50.0,
                    decoration: BoxDecoration(
                        border: Border.all(color:borderWidth<1? Colors.transparent:
                        Colors.grey, width:double.parse(borderWidth.toString())),
                        color: const Color(0xffC7CFDD).withOpacity(.42),
                        borderRadius: BorderRadius.all(Radius.circular((border)))),
                    child: Directionality(
                      textDirection:
                          Localizations.localeOf(context).countryCode == 'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                        child: TextFormField(
                          minLines: 5,
                          maxLines: 50,
                          controller: controller,
                          textInputAction: multiLine>1?TextInputAction.newline:TextInputAction.next,
                          keyboardType: onlyNumber
                              ? TextInputType.number
                              : TextInputType.name,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff32425D)
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: <TextInputFormatter>[
                            canArabic
                                ? FilteringTextInputFormatter.deny(RegExp('[]'))
                                : FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z0-9-() ]')),
                          ],
                          validator: (value) {
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          enableSuggestions: true,
                          onChanged: onchange ?? (value) {},
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical:  14),
                            hintText: hint,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xff818FA9),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxWidth: 104, minHeight: 50),
                            // icon: suffix ?? null,
                            prefixIcon: preffix ?? null,
                            suffixIcon: suffix ?? null,
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )),
              )),
        ],
      );

  static Padding getTextInputField({
    String content = '',
    String hintText,
    String labelText,
    double fontSize = 13.0,
    double hintFontSize = 15.0,
    Color fontColor ,
    Color hintFontColor,
    TextInputType keyboardType = TextInputType.text,
    bool isPasswordField = false,
    TextEditingController controller,
    Function validatorFunction,
    Function onChanged,
    TextInputAction textInputAction,
    AutovalidateMode autoValidationMode,
    List<TextInputFormatter> inputFormatters,
    suffix,
    double padding,
    int maxLines,
    prefix
  }) {
    return Padding(
      padding: EdgeInsets.only(left: padding??20, right: padding??20),
      child: Column(
        children: [
          TextFormField(
            /// text filed functionality
            maxLines: maxLines??1,
            autovalidateMode:
            autoValidationMode ?? AutovalidateMode.onUserInteraction,
            inputFormatters: [],
            controller: controller,
            obscureText: isPasswordField,
            keyboardType: keyboardType,
            validator: validatorFunction,
            onChanged: onChanged,
            textInputAction: textInputAction,

            /// text field style
            cursorColor: MyColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: labelText == null ? 19 : 11, horizontal: 12.0),

              /// Label Text
              labelText: labelText,
              labelStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: hintFontColor ??  MyColors.mediumGreyColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              /// Hint text
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: hintFontColor ??  MyColors.mediumGreyColor,
                  fontSize: hintFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              fillColor:  MyColors.textFieldBackground,
              filled: true,
              /// for password field visibility
              prefixIcon: prefix ?? null,
              suffixIcon: suffix ?? null,
            ),
          ),
        ],
      ),
    );
  }

  static RegExp upperCaseRegex = RegExp(r'[A-Z]');
  static RegExp lowerCaseRegex = RegExp(r'[a-z]');
  static RegExp containNumberRegex = RegExp(r'[0-9]');

  /// phone number validation
  static RegExp phoneNumberRegex = RegExp(r'^(?:[0][1][0125])[0-9]{8}$');

  /// email validation
  static RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  ///validation Functions
  static String validateName(String name) {
    if (!name.contains(upperCaseRegex)) {
      return ("Name must contain Uppercase letter");
    }
    if (!name.contains(lowerCaseRegex)) {
      return ("Name must contain Lowercase letter");
    }
    if (name.isEmpty) {
      return ("Name is required");
    }
    return null;
  }

  static String validateEgyptPhoneNumber(String number) {
    if (!phoneNumberRegex.hasMatch(number)) {
      return ("Invalid Mobile");
    }
    if (number.isEmpty) {
      return ("Number is required");
    }
    return null;
  }

  static String validateEmail(String email) {
    if (email.isEmpty) {
      return "Email can't be empty";
    }
    if (!emailRegex.hasMatch(email)) {
      return "Email is not valid";
    }
    return null;
  }

  static String validateNumber(String number) {
    if (number.isEmpty) {
      return "This Field can't be empty";
    }
    if (!containNumberRegex.hasMatch(number)) {
      return "Invalid Number";
    }
    return null;
  }
}
