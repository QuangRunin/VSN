

import 'package:get/get.dart';
import 'package:vsn/pages/splash/splash_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
