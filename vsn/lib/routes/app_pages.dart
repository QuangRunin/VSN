import 'package:get/get.dart';
import 'package:vsn/pages/dashboard/dashboard_binding.dart';
import 'package:vsn/pages/dashboard/dashboard_page.dart';
import 'package:vsn/pages/profile/profile_page.dart';


import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE_PAGE,
      page: () => ProfilePage(),
      binding: DashboardBinding(),
    ),
  ];
}
