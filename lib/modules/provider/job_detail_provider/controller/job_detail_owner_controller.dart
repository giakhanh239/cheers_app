import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/dialog/message_dialog.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/models/bid.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/repository/user_repository/job_repository.dart';
import 'package:freelance/routes/arguments.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class JobDetailOwnerController extends GetxController {
  final proposalController = TextEditingController();
  final Rx<Job> job = Rx(Job());

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    onLoadJob();
  }

  Future<void> onLoadJob() async {
    Job job = getScreenArgs();
    LoadingController.instance.show();
    try {
      final result = await JobRepository.detailJob(job);
      this.job.value = result;
      LoadingController.instance.hide();
    } catch (e) {
      print(e);
      Get.snackbar(
        "Errror",
        e.toString(),
      );
      LoadingController.instance.hide();
    }
  }

  Future<void> onAcceptBid(Bid? bid) async {
    try {
      final result = JobRepository.acceptBid(bid);
      Get.dialog(AlertDialog());
      LoadingController.instance.hide();
      Get.dialog(MessageDialog(
        message: "Success",
      ));
    } catch (e) {
      Get.dialog(MessageDialog(
        message: e.toString(),
      ));
      print(e);
      LoadingController.instance.hide();
    }
  }
}
