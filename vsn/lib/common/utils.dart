import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class Utils {
  static getFont({
      ThemeController theme,
      double fontSize,
      FontWeight fontWeight,
      double height = 1.0,
      Color color}) {
    return GoogleFonts.getFont(
        'Lemonada',
        textStyle: TextStyle(
            color: color != null ? color : theme.textColor,
            fontSize: theme != null ? fontSize + theme.themeFontSize : fontSize,
            fontWeight: fontWeight,
            height: height)
    );
  }
  static Future<void>  showAlertMessage(context,String message) async{
    showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo",style: TextStyle(color: Colors.black)),
          content: Text(message,style: TextStyle(color: Colors.black54)),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.pop(context, 0),
            ),
          ],
        );
      },
    );
  }
  static bool validateEmail(String email) {
    if (email.length > 0) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (regex.hasMatch(email)) {
        return true;
      }
    }
    return false;
  }
  static void showLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}