import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            reverseCurve: Curves.fastLinearToSlowEaseIn,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      ),
    );
  }
}