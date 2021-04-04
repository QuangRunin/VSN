import 'package:flutter/material.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class CustomButton extends StatelessWidget {
  ThemeController themeController;
  String title;
  VoidCallback onPressed;
  Color backgroundColor;
  double borderRadius;
  CustomButton({Key key, this.themeController, this.title, this.onPressed,this.backgroundColor,this.borderRadius = 10.0}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(width: 1, color: Colors.transparent),
        backgroundColor: backgroundColor != null ? backgroundColor : themeController.appBarColor,
        enableFeedback: true
      ),
      onPressed: () => onPressed(),
      child: Text(title,style: Utils.getFont(fontSize: 14,theme: themeController,color: themeController.appBarTextColor),textAlign: TextAlign.center),
    );
  }
}
