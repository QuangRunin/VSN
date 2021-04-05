import 'package:get/get.dart';
import 'package:vsn/pages/post_status/post_status_controller.dart';
import 'package:vsn/pages/theme/ThemeController.dart';

class PostStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostStatusController>(() => PostStatusController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}