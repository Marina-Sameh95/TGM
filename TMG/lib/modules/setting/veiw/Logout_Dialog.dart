
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/login/veiw/login_screen.dart';
import 'package:tmg/provider/main_provider.dart';

class LogoutProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<MainProvider>(
        create: (_) => MainProvider(),
        child: LogoutProviderBody(),
      ),
    );
  }
}

class LogoutProviderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 10, left: 10),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text('تسجيل خروج',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  alignment: Alignment.center,
                  child: Text('هل متأكد من تسجيل خروج؟',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: MaterialButton(
                        minWidth: 70,
                        height: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        highlightColor: Colors.transparent,
                        color: MyColors.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5)),
                        ),
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text('الغاء',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        minWidth: 70,
                        height: 30,
                        onPressed: () async{
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()),
                                  (Route<dynamic> route) => false);

                        },
                        highlightColor: Colors.transparent,
                        color: MyColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5)),
                        ),
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text('تأكيد',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
