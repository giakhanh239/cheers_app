import 'package:flutter/material.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 3));
      Get.toNamed(RouteName.auth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SvgPicture.asset(AppImages.icAppLogo,),
      )),
    );
  }
}
