import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  final dynamic icon;
  final double width;
  final Color color;
  final Color iconColor;
  VoidCallback onPressed;
  CustomIconButton({Key key,this.icon,this.width = 50.0,this.color,this.iconColor,this.onPressed}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RaisedButton(
        child: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: () {
          onPressed();
        },
        padding: EdgeInsets.all(0.0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(0.0),
        ),
        color: color,
        elevation: 0,
      ),
    );
  }
}
