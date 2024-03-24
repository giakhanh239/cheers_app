import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/app_text_form_field.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/modules/provider/job_detail_provider/controller/job_detail_owner_controller.dart';
import 'package:freelance/routes/arguments.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class JobDetailOwner extends StatelessWidget {
  JobDetailOwner({super.key}) {}

  final _controller = Get.put(JobDetailOwnerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white38,
      body: Obx(
        () => ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              _controller.job.value.name ?? "",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            space(height: 10),
            Text(
              "Time range - time range",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            space(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(20),
              child: Text(
                _controller.job.value.description ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            space(height: 20),
            Column(
              children: [
                ...?_controller.job.value.bids
                    ?.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              e.proposal ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            AppElevatedButton(
                              label: "Accept",
                              onPressed: () {
                                _controller.onAcceptBid(e);
                              },
                            )
                          ],
                        ))
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
