// ignore_for_file: sort_child_properties_last, import_of_legacy_library_into_null_safe, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tmg/constants/appColors.dart';
import 'package:tmg/modules/login/veiw/login_screen.dart';
import 'package:tmg/provider/main_provider.dart';

void main() async {
  MainProvider.navigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  SystemChrome.setEnabledSystemUIOverlays(
    SystemUiOverlay.values,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
    ChangeNotifierProvider<MainProvider>(
      create: (context) => MainProvider(),
      child:  MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: Container(child: child),
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        // navigatorKey: MainProvider.navigatorKey,  // Setting a global key for navigator
        home:
        Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: AnimatedSplashScreen(
                duration: 3000,
                centered: true,
                splashIconSize: 500,
                animationDuration: const Duration(seconds: 3),
                splash:
                /// splash screen
                Column(
                  children: [
                    Transform.scale(
                      scale: 0.9,
                      child: Image.asset(
                        'assets/images/launcher_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Transform.scale(
                      scale: 0.5,
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        backgroundColor: MyColors.textFieldBackground,
                        color: MyColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText(
                          'Loading...',
                          transitionHeight: 40,
                          duration: Duration(seconds: 3),
                          textStyle: GoogleFonts.alata(
                            textStyle: TextStyle(
                              color: MyColors.petroleumColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        RotateAnimatedText(
                          'Please wait...',
                          duration: const Duration(seconds: 2),
                          transitionHeight: 40,
                          textStyle: GoogleFonts.alata(
                            textStyle: TextStyle(
                              color: MyColors.petroleumColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ],
                ),
                nextScreen: LoginScreen(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
                backgroundColor: Colors.transparent
            )
        ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  ));

}
