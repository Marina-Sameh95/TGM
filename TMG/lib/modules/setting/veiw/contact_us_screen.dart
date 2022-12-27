
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/constants/widget/text_field.dart';
import 'package:tmg/provider/main_provider.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<MainProvider>(
        create: (_) => MainProvider(),
        child: _ContactUsScreenProviderBody(),
      ),
    );
  }
}

class _ContactUsScreenProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactUsScreenProviderBodyState();
  }
}

class _ContactUsScreenProviderBodyState
    extends State<_ContactUsScreenProviderBody> {
  bool needCall = false;
  bool needMessage = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (_, MainProvider myProvider, child) {
      return  GestureDetector(
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///call button
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 65,
                                  child: MaterialButton(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius:
                                          new BorderRadius.all(Radius.circular(20)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        (!needCall)
                                            ? needCall = true
                                            : needCall = false;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/mobile_phone.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                           "اتصل بنا",
                                          style: TextStyle(
                                            color: MyColors.petroleumColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              (needCall) ? listPhone() : Container(),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 65,
                                  child: MaterialButton(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius:
                                          new BorderRadius.all(Radius.circular(20)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        (!needMessage)?
                                        needMessage=true
                                            :
                                        needMessage=false;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset('assets/images/email_icon.png',width: 20,height: 20,),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'راسلنا',
                                          style: TextStyle(
                                            color: MyColors.petroleumColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              (needMessage)? messageForm(context,myProvider):Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
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

Widget messageForm(context, myProvider) =>
    Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ///fullName
          MyTextField.getTextInputField(
            labelText:"الاسم بالكامل",
            fontColor: MyColors.mediumGreyColor,
            keyboardType: TextInputType.text,
            isPasswordField: false,
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
            height: 20,
          ),
          ///MobileNumber
          MyTextField.getTextInputField(
            labelText:  "اكتب رقم الهاتف باللغة الإنجليزية",
            fontColor: MyColors.mediumGreyColor,
            keyboardType: TextInputType.number,
            isPasswordField: false,
          ),
          SizedBox(
            height: 20,
          ),
          ///ValidEmail
          MyTextField.getTextInputField(
            labelText:  "بريد إلكتروني",
            fontColor: MyColors.mediumGreyColor,
            keyboardType: TextInputType.text,
            isPasswordField: false,
            validatorFunction: MyTextField.validateEmail,
          ),
          SizedBox(
            height: 20,
          ),
          ///message title
          MyTextField.getTextInputField(
            labelText:  "عنوان الرساله",
            fontColor: MyColors.mediumGreyColor,
            keyboardType: TextInputType.text,
            isPasswordField: false,
          ),
          SizedBox(
            height: 20,
          ),
          ///message title
          MyTextField.getTextInputField(
            labelText:  "الرساله",
            fontColor: MyColors.mediumGreyColor,
            keyboardType: TextInputType.text,
            isPasswordField: false,
            maxLines: 5
          ),
          SizedBox(
            height: 20,
          ),

          ///Save button
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                color: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: new BorderRadius.all(Radius.circular(20)),
                ),
                onPressed: () async {},
                child: Text(
                  'ارسل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
Widget listPhone() => Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListView(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor:Colors.transparent ,
                  hoverColor:Colors.transparent ,
                  onTap: () async{
                   await launch('tel:15603');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.lightGreyColor3),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: MyColors.petroleumColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                     "خط الساخن",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyColors.mediumGreyColor),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '19691',
                                      style: TextStyle(
                                          color: MyColors.petroleumColor, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor:Colors.transparent ,
                  hoverColor:Colors.transparent ,
                  onTap: () async{
                    const url = 'http://www.talaatmoustafa.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw  'Could not launch $url';
                    }                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.lightGreyColor3),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.web,
                              color: MyColors.petroleumColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( "الموقع",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyColors.mediumGreyColor),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'http://www.talaatmoustafa.com',
                                      style: TextStyle(
                                          color: MyColors.petroleumColor, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor:Colors.transparent ,
                  hoverColor:Colors.transparent ,
                    onTap: () async{
                      await launch('tel:0233016701');
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.lightGreyColor3),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.print,
                              color: MyColors.petroleumColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "فاكس",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyColors.mediumGreyColor),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '33016701 02',
                                      style: TextStyle(
                                          color: MyColors.petroleumColor, fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
                shrinkWrap: true,
            ),

          ],
        ),
      ),
    );
