
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/setting/presenter/setting_provider.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<SettingProvider>(
        create: (_) => SettingProvider(),
        child: _AboutUsProviderBody(),
      ),
    );
  }
}

class _AboutUsProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutUsProviderBodyState();
  }
}

class _AboutUsProviderBodyState extends State<_AboutUsProviderBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (_, SettingProvider myProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/launcher_icon.png',
                          width: 200.0,
                          height: 200.0,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 1.07,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          border: Border.all(
                              width: 0.5, color: Colors.grey[600])),
                      child: Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                      Radius.circular(10),
                                      bottomRight:
                                      Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight:
                                      Radius.circular(10)),
                                ),
                                child: ListView(
                                    padding: EdgeInsets.all(15),
                                    children: [
                                      Text(
                                          "Talaat Moustafa Group (TMG) Holding is a leading conglomerate with special emphasis on developing integrated communities, including but not limited to mixed-use real estate and hospitality projects across Egypt’s key cities, with a land bank of 53 million square meters. The group has a strong track record of 50 years in the housing and real-estate development industry, having developed over 33 million sqm of land and sold over 90,000 units."
                                              " TMG's vision is 'community development' through establishing self-sustained residential city and community complexes for the upper and middle classes. TMG was the first to present the gated community concept, in its pioneering projects Al Rabwa – Al Shiekh Zayed City and Mayfair – Al Sherouq City. TMG’s vision was the main drive to additional expansions on the projects sizes, embodied in Al Rehab City, East of Cairo, spreading over 9.9 million sqm to host 200,000 residents, and the mega project “Madinaty”, spanning over 33.6 mn sqm of land with 700,000 target residents, position it the largest fully-fledged city in the Middle East. In addition to “Celia” the premium project in the New Capital, and the recently launched exclusive community “Privado - Madinaty”. In addition to superlative hotel projects; Four Seasons Sharm El Sheikh Resort, Four Seasons Nile Plaza - Cairo, Four Seasons San Stefano Grand Plaza - Alexandria and the luxurious boutique hotel; Kempinski Nile Hotel - Cairo.",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  250, 46, 46, 46),
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight.w400,
                                            ),
                                          )),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
