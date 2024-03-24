import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/app_text_form_field.dart';
import 'package:freelance/modules/register_info/controller/register_info_controller.dart';
import 'package:freelance/routes/arguments.dart';
import 'package:freelance/util/enum.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class RegisterInfoScreen extends StatelessWidget {
  RegisterInfoScreen({super.key}) {
    userRole = getScreenArgs();
  }

  final _controller = Get.put(RegisterInfoController());
  UserRole? userRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Register info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextFormField(
                label: "Name",
                isRequired: true,
                controller: _controller.nameController,
                hintText: "Full Name",
                textInputAction: TextInputAction.done,
                validator: (value) {}),
            space(height: 20),
            AppTextFormField(
                label: "Email Address",
                controller: _controller.emailController,
                hintText: "Email",
                textInputAction: TextInputAction.done,
                validator: (value) {}),
            space(height: 20),
            Text(
              userRole == UserRole.owner ? "Owner" : "Client",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            space(height: 20),
            AppElevatedButton(
              label: "Submit Info",
              onPressed: () {
                _controller.onUpdateInfo();
              },
            ),
          ],
        ),
      ),
    );
  }
}
