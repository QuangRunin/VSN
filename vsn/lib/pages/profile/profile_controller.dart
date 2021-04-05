import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/model/m_user.dart';
import 'package:vsn/pages/my_album/my_album_page.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class ProfileController extends GetxController with SingleGetTickerProviderMixin{
  var firebaseDatabase = FirebaseDatabase.instance.reference();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  MUser mUser;
  TabController tabController;
  final tabBody = <Widget>[];
  final tabs = <Tab>[];
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    initTab();
    getUser(uid: firebaseAuth.currentUser.uid);
    super.onInit();
  }
  initTab(){
    tabs.add(_customTab(Icons.image,Get.width / 2));
    tabs.add(_customTab(Icons.watch_later_sharp,Get.width / 2));
    tabBody.add(MyAlBumPage());
    tabBody.add(MyAlBumPage());
  }
  void getUser({String uid}) async{
    await firebaseDatabase.child("Users").child(uid).once().then((DataSnapshot snapshot) {
      mUser = MUser.fromJson(snapshot.value);
    });
    print(mUser.name);
    update();
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