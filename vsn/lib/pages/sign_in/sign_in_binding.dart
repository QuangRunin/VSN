import 'package:get/get.dart';
import 'package:vsn/pages/sign_in/sign_in_controller.dart';
import 'package:vsn/pages/theme/theme_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
