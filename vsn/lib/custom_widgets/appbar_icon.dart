import 'package:flutter/material.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

// ignore: must_be_immutable
class AppBarIcon extends StatelessWidget {
  ThemeController themeController;
  VoidCallback onPressed;
  Color backgroundColor;
  Color iconColor;
  dynamic icon;
  AlignmentGeometry alignment;
  AppBarIcon({Key key, this.themeController,this.alignment, this.icon, this.onPressed,this.backgroundColor,this.iconColor}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            side: BorderSide(width: 0, color: Colors.transparent),
            backgroundColor: backgroundColor!= null ? backgroundColor : themeController.appBarColor,
            padding: EdgeInsets.zero,
            alignment: alignment,

        ),
        onPressed: () => {onPressed != null ? onPressed() : null},
        child: Icon(icon,color: iconColor != null ? iconColor : themeController.appBarTextColor),
      ),
    );
  }
}
