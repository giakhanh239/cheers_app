import 'package:flutter/material.dart';
import 'package:freelance/modules/auth/auth_screen.dart';
import 'package:freelance/modules/client/job_detail_client/job_detail_client_screen.dart';
import 'package:freelance/modules/client/kol_profile_screen/kol_profile_screen.dart';
import 'package:freelance/modules/client/main_dashboard_client/main_dashboard_client_screen.dart';
import 'package:freelance/modules/phantom.dart';
import 'package:freelance/modules/provider/job_detail_provider/job_detail_provider_screen.dart';
import 'package:freelance/modules/provider/main_dasboard_provider/main_dashboard_provider_screen.dart';
import 'package:freelance/modules/register_info/register_info_screen.dart';
import 'package:freelance/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteName {
  static const String splash = "/splash";
  static const String auth = "/auth";
  static const String registerInfoScreen = "/registerInfo";
  static const String mainDashboardProviderScreen =
      "/mainDashboardProviderScreen";
  static const String mainDashboardClientScreen = "/mainDashboardClientScreen";
  static const String jobDetailClient = "/jobDetailClient";
  static const String jobDetailOwner = "/jobDetailOwner";
  static const String kolProfileScreen = "/kolProfile";
  static const String test = "/test";
}

class AppRoutes {
  static final screens = <String, Widget Function()>{
    RouteName.splash: () => const SplashScreen(),
    RouteName.auth: () => AuthScreen(),
    RouteName.registerInfoScreen: () => RegisterInfoScreen(),
    RouteName.mainDashboardProviderScreen: () => MainDashBoardProviderScreen(),
    RouteName.mainDashboardClientScreen: () => MainDashBoardClientScreen(),
    RouteName.jobDetailClient: () => JobDetailClient(),
    RouteName.jobDetailOwner: () => JobDetailOwner(),
    RouteName.test: () => Phantom(),
    RouteName.kolProfileScreen: () => KolProfileScreen()
  };

  static Route<Widget> generateRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: screens[settings.name] ?? getDefaultScreen,
    );
  }

  static Widget getDefaultScreen() => const Scaffold(
        body: Center(child: Text('Undefined')),
      );
}
