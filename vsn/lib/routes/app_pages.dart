import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vsn/common/route_transition_style/present_route.dart';
import 'package:vsn/pages/dashboard/dashboard_binding.dart';
import 'package:vsn/pages/dashboard/dashboard_page.dart';
import 'package:vsn/pages/profile/profile_page.dart';
import 'package:vsn/pages/setting_theme/setting_theme_page.dart';


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
    GetPage(
      name: AppRoutes.SETTING_THEME,
      page: () => SettingTheme(),
      binding: DashboardBinding(),
    ),
  ];
}
