import 'package:get/get.dart';
import 'package:vsn/pages/sign_up/sign_up_controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
