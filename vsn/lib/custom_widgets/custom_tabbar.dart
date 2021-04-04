import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends Container implements PreferredSizeWidget {
  CustomTabBar({this.color, this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            blurRadius: 0.5,
            spreadRadius: 0.0,
            offset: Offset(1, -1), // shadow direction: bottom right
          )
        ],
      ),
      child: tabBar,
    );
  }
}
