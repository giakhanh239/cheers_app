import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/modules/client/current_job_dashboard/current_job_dasboard_screen.dart';
import 'package:freelance/modules/client/job_dashboard/job_dashboard_screen.dart';
import 'package:freelance/modules/provider/create_job/creat_job_screen.dart';
import 'package:freelance/modules/provider/job_dashboard_owner/job_dashboard_owner_screen.dart';

class MainDashBoardProviderScreen extends StatefulWidget {
  const MainDashBoardProviderScreen({super.key});

  @override
  State<MainDashBoardProviderScreen> createState() =>
      _MainDashBoardProviderScreenState();
}

class _MainDashBoardProviderScreenState extends State<MainDashBoardProviderScreen> {
  var _pageController = PageController();

  var _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          JobDashboardOwnerScreen(),
          Container(),
          CreateJobScreen()
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
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "User"),
          BottomNavigationBarItem(
              icon: Icon(Icons.border_all_rounded), label: "Job"),
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
