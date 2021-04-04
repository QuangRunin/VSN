import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/model/m_themes.dart';
import 'package:vsn/sql_database/database_helper.dart';
enum ThemeType { Dark, Light }
class ThemeController extends GetxController {
  MThemes mThemes;
  DataBaseHelper dbHelper;
  //default Color
  Color _appBarColor = Colors.orange[900];
  Color _appBarTextColor = Colors.white;
  Color _titleColor = Colors.black;
  Color _textColor = Colors.black87;
  Color _extraColor = Color(0xff9e9e9e);
  Color _scaffoldColor = Colors.white;
  Color _iconTabColor = Colors.orange[900];
  Color _dividerColor= Color(0xff9e9e9e);
  double _themeFontSize = 0.0 ;
  int _indexTheme = 0;

  //getters
  Color get appBarColor => _appBarColor;
  Color get appBarTextColor => _appBarTextColor;
  Color get titleColor => _titleColor;
  Color get textColor => _textColor;
  Color get extraColor => _extraColor;
  Color get scaffoldColor => _scaffoldColor;
  Color get iconTabColor => _iconTabColor;
  Color get dividerColor => _dividerColor;
  double get themeFontSize => _themeFontSize;
  int get indexTheme => _indexTheme;
  @override
  void onInit() {
    initTheme();
    super.onInit();
  }
  initTheme(){
    Future.delayed(Duration.zero,() async{
      dbHelper = DataBaseHelper();
      mThemes = await dbHelper.getTheme();
      if(mThemes == null){
        dbHelper.addTheme(
            MThemes(
                appBarColor: appBarColor.toString(),
                appBarTextColor: appBarTextColor.toString(),
                titleColor: titleColor.toString(),
                textColor: textColor.toString(),
                extraColor: extraColor.toString(),
                scaffoldColor: scaffoldColor.toString(),
                iconTabColor: iconTabColor.toString(),
                dividerColor: dividerColor.toString(),
                indexTheme: 0,
                themeFontSize: 4.0
            )
        );
      }
      else {
        _appBarColor = Color(int.parse(mThemes.appBarColor.replaceAll('Color(', '').replaceAll(')', '')));
        _appBarTextColor = Color(int.parse(mThemes.appBarTextColor.replaceAll('Color(', '').replaceAll(')', '')));
        _titleColor = Color(int.parse(mThemes.titleColor.replaceAll('Color(', '').replaceAll(')', '')));
        _textColor = Color(int.parse(mThemes.textColor.replaceAll('Color(', '').replaceAll(')', '')));
        _extraColor = Color(int.parse(mThemes.textColor.replaceAll('Color(', '').replaceAll(')', '')));
        _scaffoldColor = Color(int.parse(mThemes.scaffoldColor.replaceAll('Color(', '').replaceAll(')', '')));
        _iconTabColor = Color(int.parse(mThemes.iconTabColor.replaceAll('Color(', '').replaceAll(')', '')));
        _dividerColor= Color(int.parse(mThemes.dividerColor.replaceAll('Color(', '').replaceAll(')', '')));
        _indexTheme = mThemes.indexTheme;
        _themeFontSize = mThemes.themeFontSize;
      }
    });
    update();
  }
  void signOut(){
    dbHelper = DataBaseHelper();
    dbHelper.removeTheme();
    update();
  }
  void updateThemeInItem({name,value}) async{
    switch(name){
      case "themeFontSize":
        _themeFontSize = value;
        mThemes.themeFontSize = value;
        break;
      case "appBarColor":
        _appBarColor = value;
        mThemes.appBarColor = value.toString();
        break;
      case "appBarTextColor":
        _appBarTextColor = value;
        mThemes.appBarTextColor = value.toString();
        break;
      case "titleColor":
        _titleColor = value;
        mThemes.titleColor = value.toString();
        break;
      case "textColor":
        _textColor = value;
        mThemes.textColor = value.toString();
        break;
      case "extraColor":
        _extraColor = value;
        mThemes.extraColor = value.toString();
        break;
      case "scaffoldColor":
        _scaffoldColor = value;
        mThemes.scaffoldColor = value.toString();
        break;
      case "iconTabColor":
        _iconTabColor = value;
        mThemes.iconTabColor = value.toString();
        break;
      case "dividerColor":
        _dividerColor = value;
        mThemes.dividerColor = value.toString();
        break;
      case "indexTheme":
        _indexTheme = value;
        mThemes.indexTheme = value;
        break;
    }
    dbHelper.updateThemes(mThemes);
    update();
  }
  void setThemeDefault(){
    _appBarColor = Colors.orange[900];
    _appBarTextColor = Colors.white;
    _titleColor = Colors.black;
    _textColor = Colors.black87;
    _extraColor = Color(0xff9e9e9e);
    _scaffoldColor = Colors.white;
    _iconTabColor = Colors.orange[900];
    _dividerColor= Color(0xff9e9e9e);
    update();
  }

  void setThemes(Color color, index) {
    dbHelper = DataBaseHelper();
    MThemes udTheme;
    if (color == Color(0xffffffff)) {
      _appBarTextColor = Colors.black;
    }
    else {
      _appBarTextColor = Colors.white;
    }
    _appBarColor = color;
    _titleColor = Colors.black;
    _textColor = Colors.black87;
    _extraColor = Color(0xff9e9e9e);
    _scaffoldColor = Colors.white;
    _iconTabColor = Colors.orange[900];
    _dividerColor = Color(0xff9e9e9e);
    udTheme = MThemes(
        appBarColor: _appBarColor.toString(),
        appBarTextColor: _appBarTextColor.toString(),
        titleColor: _titleColor.toString(),
        textColor: _textColor.toString(),
        extraColor: _extraColor.toString(),
        scaffoldColor: _scaffoldColor.toString(),
        iconTabColor: _iconTabColor.toString(),
        dividerColor: _dividerColor.toString(),
        indexTheme: 0,
        themeFontSize: 4.0);
    dbHelper.updateThemes(udTheme);
    update();
  }
}