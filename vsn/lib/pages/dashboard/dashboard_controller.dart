import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  @override
  void onInit() {
    super.onInit();
  }
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
