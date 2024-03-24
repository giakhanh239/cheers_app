import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class MessageDialog extends StatelessWidget {
  MessageDialog({super.key, this.message, this.isSuccess});

  final bool? isSuccess;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: Text(
              message ?? "",
              style: TextStyle(fontSize: 24),
            )),
            space(height: 20),
            Center(
              child: AppElevatedButton(
                width: double.infinity,
                label: "OK",
                onPressed: () {
                  Get.back(closeOverlays: true);
                  if (isSuccess == true) {
                    Get.offAllNamed(RouteName.mainDashboardClientScreen);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
