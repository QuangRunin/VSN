import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_view/news_feed_item.dart';
import 'package:vsn/custom_widgets/appbar_icon.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/pages/home/home_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
import 'package:vsn/routes/app_routes.dart';
class HomePage extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme){
        return Scaffold(
            appBar: CustomAppBar(
              title: Const.appName,
              themeController: theme,
              showBackIcon: false,
              centerTitle: false,
              actions: [
                AppBarIcon(
                    icon: Icons.add_a_photo,
                    themeController: theme,
                    onPressed: () => Get.toNamed(AppRoutes.POST_STATUS))
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16.0),
              physics: BouncingScrollPhysics(),
              child: GetBuilder<HomeController>(builder: (controller){
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.mPostList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return NewsFeedItem(mPost: controller.mPostList[index],themeController:theme);
                  },
                );
              }),
            )
        );
      },
    );
  }

}

