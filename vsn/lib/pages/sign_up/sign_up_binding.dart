import 'package:get/get.dart';
import 'package:vsn/pages/sign_up/sign_up_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
