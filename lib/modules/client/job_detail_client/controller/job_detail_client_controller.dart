import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/dialog/message_dialog.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/models/bid.dart';
import 'package:freelance/models/job.dart';

import 'package:freelance/repository/user_repository/job_repository.dart';
import 'package:freelance/service/phantom/phantom.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class JobDetailClientController extends GetxController {
  final proposalController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Phantom().resultStream.listen((walletData) {
      String walletStatus = walletData[0];
      if (walletStatus == "onConnect") {
      } else {
        LoadingController.instance.hide();
        Get.dialog(MessageDialog(
          message: "Success",
          isSuccess: true,
        ));
      }
    });
  }

  Future<void> onSendBid(Job? job) async {
    LoadingController.instance.show();
    final bid = Bid(job: job, proposal: proposalController.text);
    try {
      final result = await JobRepository.buy();
      final transaction = result['result']['encoded_transaction'];
      Phantom().signAndSendTransaction(transaction);
    } catch (e) {
      print(e);
      LoadingController.instance.hide();
      Get.dialog(MessageDialog(
        message: e.toString(),
      ));
    }
  }
}
