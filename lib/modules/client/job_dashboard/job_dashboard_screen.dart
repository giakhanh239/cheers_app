import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/modules/client/job_dashboard/controller/job_dashboard_controller.dart';
import 'package:freelance/modules/client/job_dashboard/widget/big_view_project.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';

import 'widget/job_item.dart';
import 'package:get/get.dart';

class JobDashboardScreen extends StatelessWidget {
  JobDashboardScreen({super.key});

  final _controller = Get.put(JobDashboardController());

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
          extendBody: true,
          backgroundColor: Colors.transparent,
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(40),
          //   child: _buildTab(),
          // ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Obx(
                          () =>
                              ListView(padding: EdgeInsets.all(20), children: [
                            Text(
                              "Trending",
                              style: AppStyles.headline1Style,
                            ),
                            space(height: 20),
                            SizedBox(
                              height: 100,
                              child: PageView(
                                controller: _controller.pageController,
                                children: [
                                  BigViewProject(),
                                  BigViewProject(),
                                  BigViewProject(),
                                ],
                                onPageChanged: (page) {
                                  _controller.selectedPage.value = page;
                                },
                              ),
                            ),
                            space(height: 20),
                            Obx(
                              () => indicator(_controller.selectedPage.value),
                            ),
                            space(height: 20),
                            Text(
                              "Following",
                              style: AppStyles.headline3Style,
                            ),
                            space(height: 20),
                            ..._controller.jobList
                                .map((element) => _buildJobItem(element as Job))
                                .toList(),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobItem(Job? job) {
    return Column(
      children: [
        JobItem(
          name: "Chung ta cua qua khu",
          job: job,
        ),
        space(height: 20)
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 30,
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: _controller.tabController,
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
                      children: [
                        Expanded(child: Center(child: Text("Trending")))
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Expanded(child: Center(child: Text("Following")))
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Expanded(child: Center(child: Text("Favorite")))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
