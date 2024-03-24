import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/modules/provider/create_job/controller/create_job_controller.dart';
import 'package:freelance/util/ultility.dart';

import '../../../common/app_text_form_field.dart';
import 'package:get/get.dart';

class CreateJobScreen extends StatelessWidget {
  CreateJobScreen({super.key});

  final _controller = Get.put(CreateJobController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextFormField(
                label: "Name",
                isRequired: true,
                controller: _controller.nameController,
                hintText: "Job Name",
                textInputAction: TextInputAction.done,
                validator: (value) {}),
            space(height: 20),
            AppTextFormField(
                label: "Description",
                controller: _controller.descriptionController,
                hintText: "",
                maxLines: 9,
                isRequired: true,
                textInputAction: TextInputAction.done,
                validator: (value) {}),
            space(height: 20),
            AppTextFormField(
                label: "Price",
                isRequired: true,
                controller: _controller.priceController,
                hintText: "0",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                validator: (value) {}),
            space(height: 20),
            AppElevatedButton(
              label: "Create job",
              width: double.infinity,
              onPressed: () {
                _controller.onCreateJob();
              },
            ),
          ],
        ),
      ),
    );
  }
}
