import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/pages/sign_up/sign_up_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class SignUpPage  extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme){
      return Scaffold(
        appBar: CustomAppBar(
          title: Const.signUp,
          themeController: theme,
          showBackIcon: false,
        ),
      );
    });
  }
}