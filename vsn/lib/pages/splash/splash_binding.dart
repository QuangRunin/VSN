

import 'package:get/get.dart';
import 'package:vsn/pages/splash/splash_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
