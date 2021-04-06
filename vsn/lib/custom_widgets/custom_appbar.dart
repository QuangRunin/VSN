import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/custom_widgets/appbar_icon.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    BuildContext context,
    String title,
    Widget widgetTitle,
    VoidCallback onBackAction,
    List<Widget> actions ,
    double elevation,
    Widget bottom,
    bool showBackIcon = true,
    bool automaticallyImplyLeading = true,
    bool centerTitle = true,
    ThemeController themeController,
  }) : super(
    title: Text(title, style: GoogleFonts.getFont('Lemonada',textStyle:TextStyle(color: themeController.appBarTextColor))),
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor:  themeController.appBarColor,
    leading: showBackIcon ?  AppBarIcon(
      icon: Icons.arrow_back_rounded,
      themeController: themeController,
      onPressed: onBackAction != null ? onBackAction : () => Get.back(),
    ): null,
    centerTitle: centerTitle,
    actions: actions,
    elevation: elevation,
    bottom:bottom,
  );
}