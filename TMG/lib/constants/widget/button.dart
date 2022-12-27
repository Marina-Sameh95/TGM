import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmg/constants/appColors.dart';

class AppButton extends StatefulWidget {
  final Color color;
  final double height;
  final double width;
  final double textSize;
  final String buttonText;
  final Color textColor;
  final VoidCallback onPressed;
  Widget child;
  AppButton({
    Key key,
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.buttonText,
    this.textColor,
     this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState(
      color: color ?? MyColors.primaryColor,
      height: height ?? 55,
      width: width ?? double.maxFinite,
      textSize: textSize ?? 18,
      buttonText: buttonText ?? '',
      textColor: textColor ?? Colors.white,
      onPressed: onPressed,
      child:child,
  );
}

class _AppButtonState extends State<AppButton> {
  Color color = MyColors.primaryColor;
  double height;
  double width;
  double textSize;
  String buttonText;
  Color textColor;
  Widget child;
  final VoidCallback onPressed;

  _AppButtonState({
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.buttonText,
    this.textColor,
    this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? height,
      width: width ?? width,
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor:Colors.transparent ,
        hoverColor:Colors.transparent ,
        color:color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: new BorderRadius.all(Radius.circular(20)),
        ),
        child: child??Text(
          buttonText,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              textStyle:TextStyle(
            fontSize: textSize,
            color: textColor,
           fontWeight: FontWeight.w500
          )),
        ),
      ),
    );
  }
}
