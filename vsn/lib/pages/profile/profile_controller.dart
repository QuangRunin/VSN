import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/pages/my_album/my_album_page.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class ProfileController extends GetxController with SingleGetTickerProviderMixin{
  TabController tabController;
  final tabBody = <Widget>[];
  final tabs = <Tab>[];
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    initTab();
    super.onInit();
  }
  initTab(){
    tabs.add(_customTab(Icons.image,Get.width / 2));
    tabs.add(_customTab(Icons.watch_later_sharp,Get.width / 2));
    tabBody.add(MyAlBumPage());
    tabBody.add(MyAlBumPage());
  }
}
Widget _customTab(icon,width) {
  return Tab(
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Icon(icon),
      )
  );
}