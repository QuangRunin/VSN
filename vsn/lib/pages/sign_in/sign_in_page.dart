import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/custom_widgets/custom_textfield.dart';
import 'package:vsn/pages/sign_in/sign_in_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
import 'package:vsn/routes/app_routes.dart';

class SignInPage  extends GetView<SignInController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
     builder: (theme){
      return Scaffold(
        appBar: CustomAppBar(
          title: Const.signIn,
          themeController: theme,
          showBackIcon: false,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    ListView.builder(
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: CustomTextField(
                            label: controller.arrSignIn[index],
                            activeObscureText: index == 1 ? true : false,
                            onChanged: (String value){
                              controller.setMSignIn(type: index,value: value.trim());
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                           Get.offNamed(AppRoutes.SIGN_UP);
                          },
                          child: Text(
                            Const.signUp,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomButton(
                        title: Const.signIn,
                        themeController: theme,
                        onPressed: (){
                          controller.signInWithEmailAndPassword(context);
                        },
                      )
                    )
                  ],
                )
            ),
          )
        ),
      );
    });
  }
}