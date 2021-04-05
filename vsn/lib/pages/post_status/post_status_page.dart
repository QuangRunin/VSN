import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/custom_widgets/custom_textfield.dart';
import 'package:vsn/pages/post_status/post_status_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

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
              ),
            )
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
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
              ),
              Text("1313")
            ],
          ),
        ),
      );
    });
  }
}