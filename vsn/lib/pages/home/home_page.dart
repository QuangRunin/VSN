import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_view/news_feed_item.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller){
        return Scaffold(
            appBar: CustomAppBar(
                title: Const.appName,
                themeController: controller,
                showBackIcon: false,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 55.0),
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NewsFeedItem(themeController:controller);
                },
              ),
            )
        );
      },
    );
  }
}
