import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/styles.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/custom_widgets/appbar_icon.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_tabbar.dart';
import 'package:vsn/pages/profile/profile_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';
import 'package:vsn/routes/app_routes.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (theme){
        return Scaffold(
            appBar: CustomAppBar(
              title: Const.myPage,
              themeController: theme,
              actions: [
                AppBarIcon(themeController: theme,icon: Icons.settings,onPressed: () => Get.toNamed(AppRoutes.SETTING_THEME))
              ],
            ),
            body:  NestedScrollView(
              // controller: scrollController,
                physics: ScrollPhysics(parent: PageScrollPhysics()),
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                        floating: true,
                        pinned: true,
                        stretch: true,
                        backgroundColor: Colors.white,
                        forceElevated: value,
                        brightness: Brightness.light,
                        elevation:2,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 16.0),
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                child: CachedNetworkImage(
                                  imageUrl: noImage1,
                                  placeholder: (context, url) =>  Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                                  errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                                  fit: BoxFit.cover,
                                  width: 125.0,
                                  height: 125.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text("Nguyen Hong Quang",style: Utils.getFont(theme:theme,fontSize: 14.0,fontWeight: FontWeight.w500,color: theme.titleColor)),
                              SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(width: 16.0),
                                  customBox(theme: theme,title: Const.post,value: "5"),
                                  Text("|",style: TextStyle(color: Colors.grey)),
                                  customBox(theme: theme,title: Const.following,value: "1"),
                                  Text("|",style: TextStyle(color: Colors.grey)),
                                  customBox(theme: theme,title: Const.followed,value: "1.5m"),
                                  SizedBox(width: 16.0),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              InkWell(
                                  onTap: (){

                                  },
                                  child: Text("Chỉnh sửa hồ sơ",
                                      style: Utils.getFont(
                                          theme: theme,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue)
                                  )
                              ),
                            ],
                          ),
                        ),
                        centerTitle: true,
                        expandedHeight: 330,
                        bottom: CustomTabBar(
                          color: Colors.white,
                          tabBar: TabBar(
                            onTap: (i) async{
                            },
                            isScrollable: true,
                            tabs: controller.tabs,
                            indicatorColor: Colors.black,
                            controller: controller.tabController,
                            unselectedLabelColor:Colors.grey,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.only(left: 8,right: 8,bottom: 0),
                            labelPadding: EdgeInsets.only(left: 8.0,right: 8,bottom: 0),
                            dragStartBehavior: DragStartBehavior.down,

                          ),
                        )
                    ),
                  ];
                },
                body: TabBarView(
                  children: controller.tabBody,
                  physics: BouncingScrollPhysics(),
                  controller: controller.tabController,
                )
            )
        );
      },
    );
  }
  Widget customBox({ThemeController theme,String title, String value}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value,style: Utils.getFont(theme: theme,fontSize: 12.0,fontWeight: FontWeight.w800)),
        SizedBox(height: 5.0),
        Text(title,style: Utils.getFont(theme: theme,fontSize: 10.0,fontWeight: FontWeight.w400,color: Colors.grey)),
      ],
    );
  }
}