import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:vsn/common/route_transition_style/present_route.dart';
import 'package:vsn/pages/dashboard/dashboard_binding.dart';
import 'package:vsn/pages/dashboard/dashboard_page.dart';
import 'package:vsn/pages/post_status/post_status_binding.dart';
import 'package:vsn/pages/post_status/post_status_page.dart';
import 'package:vsn/pages/profile/profile_page.dart';
import 'package:vsn/pages/setting_theme/setting_theme_page.dart';
import 'package:vsn/pages/sign_in/sign_in_binding.dart';
import 'package:vsn/pages/sign_in/sign_in_page.dart';
import 'package:vsn/pages/sign_up/sign_up_binding.dart';
import 'package:vsn/pages/sign_up/sign_up_page.dart';
import 'package:vsn/pages/splash/splash_binding.dart';
import 'package:vsn/pages/splash/splash_page.dart';


import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding()
    ),
    GetPage(
        name: AppRoutes.SIGN_UP,
        page: () => SignUpPage(),
        binding: SignUpBinding()
    ),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => SignInPage(),
        binding: SignInBinding()
    ),
    GetPage(
        name: AppRoutes.POST_STATUS,
        page: () => PostStatusPage(),
        binding: PostStatusBinding(),
        transition: Transition.topLevel,
        transitionDuration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        fullscreenDialog: true,
        // customTransition: PresentRoute()
    ),
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
    GetPage(
      name: AppRoutes.SETTING_THEME,
      page: () => SettingTheme(),
      binding: DashboardBinding(),
    ),
  ];
}
