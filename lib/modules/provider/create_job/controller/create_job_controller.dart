import 'package:flutter/cupertino.dart';
import 'package:freelance/common/global_loading/global_loading.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/repository/user_repository/job_repository.dart';
import 'package:get/get.dart';

class CreateJobController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  void resetState() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  Future<void> onCreateJob() async {
    LoadingController.instance.show();
    Job job = Job(
        name: nameController.text,
        description: descriptionController.text,
        price: int.tryParse(priceController.text));
    try {
      final result = await JobRepository.createJob(job);
      Get.snackbar(
        "Success",
        "Create Job Success",
      );
      LoadingController.instance.hide();
    } catch (e) {
      Get.snackbar(
        "Errror",
        e.toString(),
      );
      LoadingController.instance.hide();
    }
  }
}
