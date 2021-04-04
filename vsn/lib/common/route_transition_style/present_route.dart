import 'package:flutter/material.dart';
class PresentRoute extends PageRouteBuilder {
  final Widget page;
  PresentRoute({this.page}) : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation),
          child: child,
        ),
  );
}