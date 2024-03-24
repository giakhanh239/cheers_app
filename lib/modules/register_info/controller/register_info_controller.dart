import 'package:flutter/material.dart';
import 'package:freelance/models/user.dart';
import 'package:freelance/repository/user_repository/user_repository.dart';
import 'package:freelance/routes/routes.dart';
import 'package:get/get.dart';

class RegisterInfoController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  Future<void> onUpdateInfo() async {
    User user = User(name: nameController.text, email: emailController.text);
    try {
      final result = await UserRepository.updateProfile(user);
      Get.offAllNamed(RouteName.mainDashboardClientScreen);
    } catch (e) {
      print(e);
    }
  }
}
