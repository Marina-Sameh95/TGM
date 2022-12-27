
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/home/presenter/home_provider.dart';
import 'package:tmg/modules/setting/presenter/setting_provider.dart';
import 'package:tmg/modules/setting/veiw/Logout_Dialog.dart';
import 'package:tmg/modules/setting/veiw/aboutUs_screen.dart';
import 'package:tmg/modules/setting/veiw/contact_us_screen.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<SettingProvider>(
        create: (_) => SettingProvider(),
        child: _SettingProviderBody(),
      ),
    );
  }
}

class _SettingProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingProviderBodyState();
  }
}

class _SettingProviderBodyState extends State<_SettingProviderBody> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (_, SettingProvider myProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
             ///aboutUs
             InkWell(
               splashColor: Colors.transparent,
               highlightColor:Colors.transparent ,
               hoverColor:Colors.transparent ,
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => AboutUs()));
               },
               child: Container(
                 width: double.maxFinite,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10.0),
                   child: Directionality(
                     textDirection: TextDirection.rtl,
                     child: Container(
                       padding: const EdgeInsets.only(left: 16, right: 16),
                       color: Colors.white,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Icon(
                               Icons.info_outline_rounded,
                               color: MyColors.primaryColor
                           ),
                           SizedBox(
                             width: 10,
                           ),
                           Text(
                             'من نحن',
                             style: GoogleFonts.roboto(
                               textStyle: TextStyle(
                                 color: Color(0xff99a7b0),
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 3.0,
                color: Colors.grey[500],
              ),
              SizedBox(
                height: 15,
              ),
              ///contactUs
              InkWell(
                splashColor: Colors.transparent,
                highlightColor:Colors.transparent ,
                hoverColor:Colors.transparent ,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactUsScreen()));
                },
                child: Container(
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                                Icons.call_rounded,
                                color: MyColors.primaryColor
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'إتصل بنا',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Color(0xff99a7b0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 3.0,
                color: Colors.grey[500],
              ),
              SizedBox(
                height: 15,
              ),
              ///logout
              InkWell(
                splashColor: Colors.transparent,
                highlightColor:Colors.transparent ,
                hoverColor:Colors.transparent ,
                onTap: () {
                  showDialog(
                    builder: (context) => Container(
                      alignment: Alignment.center,
                      child: LogoutProviderDemo(),
                    ),
                    context: context,
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                                Icons.logout,
                                color: MyColors.primaryColor
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'تسجيل الخروج',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Color(0xff99a7b0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    });
  }
}
