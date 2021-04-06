import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_tabbar.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

class SettingTheme extends GetView{
  @override
  Widget build(BuildContext context) {
   return GetBuilder<ThemeController>(
     builder: (controller){
       return Scaffold(
           appBar: CustomAppBar(
               title: Const.settingTheme,
               themeController: controller,
               bottom: CustomTabBar(
                 color: controller.appBarColor,
                 tabBar: TabBar(
                   onTap: (i) async{
                   },
                   isScrollable: false,
                   tabs: controller.tabs,
                   indicatorColor: controller.appBarTextColor,
                   controller: controller.tabController,
                   unselectedLabelColor:Colors.grey,
                   indicatorSize: TabBarIndicatorSize.tab,
                   indicatorPadding: EdgeInsets.only(left: 8,right: 8,bottom: 0),
                   labelPadding: EdgeInsets.only(left: 8.0,right: 8,bottom: 0),
                 ),
               )
           ),
           body: TabBarView(
             children: controller.tabBody,
             physics: BouncingScrollPhysics(),
             controller: controller.tabController,
           )
       );
     },
   );
  }
  // Future<bool> _openFullMaterialColorPicker({ThemeController model, context,Color selectedColor, String picker}) async {
  //   return ColorPicker(
  //     color: selectedColor,
  //     onColorChanged: (color) {
  //       switch (picker) {
  //         case "AppBar Color ": {
  //           model.setThemes(color);
  //           break;
  //         }
  //         case "AppBar Text Color": {
  //           model.setAppBarTextColor(color);
  //           break;
  //         }
  //         case "Title Color":{
  //           model.setTitleColor(color);
  //           break;
  //         }
  //         case "Text Color": {
  //           model.setTextColor(color);
  //           break;
  //         }
  //         case "Extra Color": {
  //           model.setExtraColor(color);
  //           break;
  //         }
  //         case "Background Color": {
  //           model.setScaffoldColor(color);
  //           break;
  //         }
  //         case "Icon Tab Color":{
  //           model.setIconTabColor(color);
  //           break;
  //         }
  //         case "Divider Color":{
  //           model.setDividerColor(color);
  //           break;
  //         }
  //       }
  //     },
  //     width: 40,
  //     height: 40,
  //     borderRadius: 4,
  //     spacing: 5,
  //     runSpacing: 5,
  //     wheelDiameter: 155,
  //     heading: Text(
  //       'Chọn màu',
  //       style: Theme.of(context).textTheme.subtitle1,
  //     ),
  //     subheading: Text(
  //       'Chọn đổ bóng màu',
  //       style: Theme.of(context).textTheme.subtitle1,
  //     ),
  //     wheelSubheading: Text(
  //       'Tùy biến màu đã chọn',
  //       style: Theme.of(context).textTheme.subtitle1,
  //     ),
  //     showMaterialName: true,
  //     showColorName: true,
  //     showColorCode: true,
  //     materialNameTextStyle: Theme.of(context).textTheme.caption,
  //     colorNameTextStyle: Theme.of(context).textTheme.caption,
  //     colorCodeTextStyle: Theme.of(context).textTheme.caption,
  //     pickersEnabled: const <ColorPickerType, bool>{
  //       ColorPickerType.both: false,
  //       ColorPickerType.primary: true,
  //       ColorPickerType.accent: true,
  //       ColorPickerType.bw: false,
  //       ColorPickerType.custom: true,
  //       ColorPickerType.wheel: true,
  //     },
  //
  //   ).showPickerDialog(
  //     context,
  //     constraints:
  //     const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
  //   );
  // }
  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Theme Colour Applied'),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}