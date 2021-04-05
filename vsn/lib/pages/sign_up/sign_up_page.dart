import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vsn/common/const.dart';
import 'package:vsn/custom_widgets/custom_appbar.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/custom_widgets/custom_textfield.dart';
import 'package:vsn/pages/sign_up/sign_up_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';
import 'package:vsn/routes/app_routes.dart';

class SignUpPage  extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder:(theme){
      return Scaffold(
        appBar: CustomAppBar(
          title: Const.signUp,
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
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: CustomTextField(
                              label: controller.arrSignUp[index],
                              activeObscureText: index == 2 || index == 3 ? true : false,
                              onChanged: (String value){
                                controller.setMSignUp(type: index,value: value.trim());
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
                              Get.offNamed(AppRoutes.SIGN_IN);
                            },
                            child: Text(
                              Const.signIn,
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
                            title: Const.signUp,
                            themeController: theme,
                            onPressed: (){
                              controller.signUpWithEmailAndPassword(context);
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