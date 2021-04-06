
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/model/m_user.dart';
import 'package:vsn/pages/my_album/my_album_page.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
import 'package:vsn/routes/app_routes.dart';

class ProfileController extends GetxController with SingleGetTickerProviderMixin{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;
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

  void getUser({String uid}) async {
   await _fire.collection(Const.userCollection)
        .doc(uid)
        .get()
        .then((snapshot) => {mUser = MUser.fromJson(snapshot.data())});
    update();
  }

  void signOut() async{
    firebaseAuth.signOut();
    Get.offNamed(AppRoutes.SIGN_IN);
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