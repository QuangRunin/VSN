import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:vsn/routes/app_routes.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin{
  AnimationController animationController;
  Animation<double> animation;
  @override
  void onInit() {
    animationController = new AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => update());
    animationController.forward();
    startTime();
    super.onInit();
  }
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.offNamed(AppRoutes.SIGN_UP);
    // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    // if(firebaseAuth.currentUser != null){
    //   Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
    // }
    // else {
    //   Navigator.of(context).pushReplacementNamed(SIGN_IN);
    // }
  }
}