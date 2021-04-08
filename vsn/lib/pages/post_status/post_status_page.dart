import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_widgets/appbar_icon.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/custom_widgets/custom_textfield.dart';
import 'package:vsn/pages/post_status/post_status_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

class PostStatusPage extends GetView<PostStatusController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme){
      return Scaffold(
        appBar: CustomAppBar(
          title: Const.postStatus,
          themeController: theme,
          centerTitle: false,
          actions: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: CustomButton(
                title: 'POST',
                themeController: theme,
                borderRadius: 30,
                backgroundColor: Colors.blue,
                onPressed: (){
                  controller.postStatus(context);
                },
              ),
            )
          ],
        ),
        body: GestureDetector(
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          minLines: 1,
                          maxLines: 10,
                          onChanged: (value){
                            controller.setStatus(data: value);
                          },
                          style: new TextStyle(fontSize: 16.0),
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Trạng thái của bạn?'
                          ),
                        ),
                      ),
                      GetBuilder<PostStatusController>(builder: (controller){
                        return controller.image != null ? new Image.file(controller.image) : SizedBox();
                      })
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppBarIcon(
                      icon: Icons.image,
                      themeController: theme,
                      backgroundColor: Colors.white,
                      iconColor: Colors.grey,
                      alignment: Alignment.centerRight,
                      onPressed: (){
                        controller.getImage(type: 1);
                      },
                    ),
                    AppBarIcon(
                      icon: Icons.camera_alt_rounded,
                      themeController: theme,
                      backgroundColor: Colors.white,
                      iconColor: Colors.grey,
                      onPressed: (){
                        controller.getImage(type: 0);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}