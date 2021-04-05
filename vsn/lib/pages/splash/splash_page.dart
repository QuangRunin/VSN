import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/pages/splash/splash_controller.dart';

class SplashPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/images/splash.png',height: 25.0,fit: BoxFit.scaleDown,))
              ]
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GetBuilder<SplashController>(builder: (controller){
                return Image.asset(
                  'assets/images/splash.png',
                  width: controller.animation.value * 250,
                  height: controller.animation.value * 250,
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}