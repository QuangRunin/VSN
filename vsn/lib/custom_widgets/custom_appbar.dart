import 'package:flutter/material.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    BuildContext context,
    String title,
    dynamic icon,
    Widget widgetTitle,
    bool titleType,
    VoidCallback onBackClick,
    bool showActionButton,
    int actionCount,
    VoidCallback onFirstAction,
    VoidCallback onLastAction,
    String firstIcon,
    String lastIcon,
    double elevation,
    Widget bottom,
    bool backgroundColor,
    bool showLeftIcon = true,
    bool automaticallyImplyLeading = true,
    ThemeController themeController,
  }) : super(
    title: Text(title,style: TextStyle(color: themeController.textColor)),
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor:  themeController.appBarColor,
    leading: showLeftIcon ?  MaterialButton(
      onPressed: () {
        onBackClick();
      },
      color:  themeController.appBarColor,
      textColor: Colors.white,
      child: Icon(
        icon,
        size: 18,
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    ): SizedBox(height: 0),
    actions: showActionButton ? (actionCount == 1 ? <Widget>[
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey.withOpacity(0.1),
        onTap:() {
          onFirstAction();
        },
        child: Container(
          height: 100.0,
          width: 40.0,
          padding: EdgeInsets.only(left: 8),
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            splashRadius: 20,
            icon: Image.asset(firstIcon, fit: BoxFit.contain, height: 20, width: 20,),
          ),
        ),
      ),
    ] : <Widget>[
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey.withOpacity(0.1),
        onTap:() {
          onFirstAction();
        },
        child: Container(
          height: 50.0,
          width: 40.0,
          padding: EdgeInsets.only(left: 10.0,right: 8.0,bottom: 10.0,top: 10.0),
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            splashRadius: 20,
            icon: Image.asset(firstIcon, fit: BoxFit.contain, height: 20, width: 20),
          ),
        ),
      ),
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.grey.withOpacity(0.1),
        onTap: () {
          onLastAction();
        },
        child: Container(
          padding: EdgeInsets.only(left: 4.0,right: 8.0,bottom: 16.0,top: 16.0),
          height: 50.0,
          width: 40.0,
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            iconSize: 20,
            splashRadius: 20,
            icon: Image.asset(lastIcon, fit: BoxFit.contain, height: 20, width: 20,),
          ),
        ),
      ),
    ]) : null,
    centerTitle: true,
    elevation: elevation,
    bottom:bottom,
  );
}