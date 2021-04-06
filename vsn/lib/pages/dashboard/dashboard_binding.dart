import 'package:get/get.dart';
import 'package:vsn/pages/home/home_controller.dart';
import 'package:vsn/pages/profile/profile_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ThemeController>(() => ThemeController());

  }
}
