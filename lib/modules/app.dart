import 'package:flutter/material.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/modules/splash/splash_screen.dart';
import 'package:freelance/routes/routes.dart';
import 'package:get/get.dart';

import '../binding/app_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoadingOverlay(
      child: GetMaterialApp(
        navigatorKey: Get.key,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteName.splash,
        initialBinding: AppBinding(),
        enableLog: true,
      ),
    );
  }
}
