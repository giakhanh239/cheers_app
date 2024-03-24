import 'package:flutter/material.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/modules/client/job_dashboard/controller/job_dashboard_controller.dart';
import 'package:freelance/modules/provider/job_dashboard_owner/controller/job_dashboard_owner_controller.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/util/ultility.dart';

import 'widget/job_item_owner.dart';
import 'package:get/get.dart';

class JobDashboardOwnerScreen extends StatelessWidget {
  JobDashboardOwnerScreen({super.key});

  final _controller = Get.put(JobDashboardOwnerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.withOpacity(0.5),
      child: RefreshIndicator(
        onRefresh: () async {
          _controller.onGetJobs();
        },
        child: Obx(
          () => ListView(
            padding: EdgeInsets.all(20),
            children: _controller.jobList
                .map((element) => _buildJobItem(element as Job))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildJobItem(Job? job) {
    return Column(
      children: [
        JobItemOwner(
          job: job,
        ),
        space(height: 20)
      ],
    );
  }
}
