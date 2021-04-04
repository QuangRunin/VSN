import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/common/styles.dart';
import 'package:vsn/pages/theme/ThemeController.dart';
class ThemeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller){
      return  SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.themeList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: Get.width / (Get.height / 1.4),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (contexts, index) {
              return InkWell(
                highlightColor: Colors.grey.withOpacity(0.1),
                splashColor: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                onTap: () {
                  if(index == 0){
                    controller.setThemeDefault();
                  }
                  else {
                    controller.setThemes(controller.themeList[index], index);
                  }
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: controller.themeList[index],
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.25), offset: Offset(0, 0), blurRadius:0.5, spreadRadius: 0.5)
                        ],
                      ),
                    ),
                    controller.indexTheme == index ? Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                      ),
                    ): SizedBox(height: 0)
                  ],
                ),
              );
            }),
      );
    });
  }
}
