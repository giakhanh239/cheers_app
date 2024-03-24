import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance/modules/auth/client_auth.dart';
import 'package:freelance/modules/auth/controller/auth_controller.dart';
import 'package:freelance/modules/auth/provider_auth.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends GetWidget<AuthController> {
  AuthScreen({super.key});

  @override
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.imgBackground,
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColors.subGradientFloorColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      space(height: 30),
                      SvgPicture.asset(AppImages.icAppLogo,height: 50,),
                      space(height: 10),
                      Text(
                        "Easy Login or Register",
                        style: AppStyles.headline3Style,
                      ),
                      space(height: 10),
                      Text(
                        "Are you",
                        style: AppStyles.headline2Style,
                      ),
                      space(height: 20),
                      _buildTabController(),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabController() {
    return Container(
      height: 200,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _buildTab(),
        SizedBox(
          height: 100,
          child: TabBarView(
            controller: controller.tabController,
            children: [
              ProviderAuth(
                onConnect: () {
                  controller.onConnectWallet();
                },
              ),
              ClientAuth(
                onConnect: () async {
                  await controller.onConnectWallet();
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Container _buildTab() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.mainColor, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TabBar(
          dividerColor: Colors.transparent,
          controller: controller.tabController,
          labelPadding: EdgeInsets.zero,
          labelColor: AppColors.mainLabelColor,
          labelStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: AppColors.mainLabelColor,
          unselectedLabelStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w700,
          ),
          indicator: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment(0.72, 0.5),
            end: Alignment(0.1, 0.5),
            colors: [
              AppColors.mainColor,
              AppColors.secondaryColor,
            ],
          )),
          isScrollable: false,
          tabs: [
            Tab(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [Expanded(child: Center(child: Text("Artist")))],
                ),
              ),
            ),
            Tab(
              child: Row(
                children: [Expanded(child: Center(child: Text("Buyer")))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
