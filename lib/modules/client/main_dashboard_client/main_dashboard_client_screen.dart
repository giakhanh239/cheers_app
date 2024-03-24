import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/common/main_app_bar.dart';
import 'package:freelance/modules/client/current_job_dashboard/current_job_dasboard_screen.dart';
import 'package:freelance/modules/client/job_dashboard/job_dashboard_screen.dart';
import 'package:freelance/modules/client/profile_screen/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';

class MainDashBoardClientScreen extends StatefulWidget {
  const MainDashBoardClientScreen({super.key});

  @override
  State<MainDashBoardClientScreen> createState() =>
      _MainDashBoardClientScreenState();
}

class _MainDashBoardClientScreenState extends State<MainDashBoardClientScreen> {
  var _pageController = PageController();

  var _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MainAppBar().build(context),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          CurrentJobDashboardScreen(),
          JobDashboardScreen(),
          ProfileScreen()
        ],
        onPageChanged: (index) {
          if (index != _currentTab) {
            setState(() {
              _currentTab = index;
            });
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: AppStyles.regular2,
        unselectedLabelStyle: AppStyles.regular2,
        elevation: 0,
        backgroundColor: AppColors.bottomBarColor,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.icKol), label: "KOLS"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.icHome), label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.icUser), label: "User"),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
