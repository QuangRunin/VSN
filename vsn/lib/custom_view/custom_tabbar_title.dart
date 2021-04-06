import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
// ignore: must_be_immutable
class CustomTabBarTitle extends StatelessWidget {
  double width;
  String title;
  CustomTabBarTitle({Key key, this.width, this.title}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller){
      return Container(
        width: width,
        alignment: Alignment.center,
        child: Text(title,style: Utils.getFont(fontSize: 18.0,color: controller.appBarTextColor,fontWeight: FontWeight.w700)),
      );
    });
  }
}
