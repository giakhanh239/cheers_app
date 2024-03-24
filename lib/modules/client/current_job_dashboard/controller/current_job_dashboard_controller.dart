import 'package:flutter/material.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/repository/user_repository/job_repository.dart';
import 'package:freelance/util/enum.dart';
import 'package:get/get.dart';

class CurrentJobDashboardController extends GetxController {
  RxList jobList = RxList<Job>([]);
  RxInt selectedPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    onGetJobs();
  }

  Future<void> onGetJobs() async {
    LoadingController.instance.show();
    try {
      final jobs = await JobRepository.getJobs();
      jobList.value = jobs
          .where((element) => element.status == JobStatus.processing.name)
          .toList();
      LoadingController.instance.hide();
    } catch (e) {
      print(e);
      LoadingController.instance.hide();
    }
  }
}
