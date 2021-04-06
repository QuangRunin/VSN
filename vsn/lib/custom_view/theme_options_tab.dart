import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsn/custom_widgets/custom_button.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
class ThemeOptionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller){
        var customOptionColor = [controller.appBarColor,controller.appBarTextColor,controller.titleColor,controller.textColor,controller.extraColor,controller.scaffoldColor,controller.iconTabColor,controller.dividerColor,controller.themeFontSize];
        return SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: controller.customOption.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 10.0 : 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: 75.0,
                        height: 75.0,
                        margin: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: customOptionColor[index],
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.25), offset: Offset(0, 0), blurRadius:2, spreadRadius: 1)
                          ],
                        ),
                      ),
                      CustomButton(
                          title: controller.customOption[index],
                          themeController: controller,
                          backgroundColor: Colors.grey,
                          onPressed: (){
                            _openFullMaterialColorPicker(context: context,theme: controller,optionName: controller.customOption[index]);
                         },
                      )
                    ],
                  ),
                );
              }),
        );
    });
  }
  Future<bool> _openFullMaterialColorPicker({context,ThemeController theme,optionName}) async {
    return ColorPicker(
      color: Colors.red,
      onColorChanged: (color) {
        theme.updateThemeInItem(name: optionName,value: color);
      },
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Chọn màu',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subheading: Text(
        'Chọn đổ bóng màu',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Tùy biến màu đã chọn',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.caption,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },

    ).showPickerDialog(
      context,
      constraints:
      const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }
}
