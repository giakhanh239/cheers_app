import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/app_text_form_field.dart';
import 'package:freelance/common/main_app_bar.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/modules/client/job_detail_client/controller/job_detail_client_controller.dart';
import 'package:freelance/routes/arguments.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/enum.dart';
import 'package:freelance/util/ultility.dart';
import 'package:get/get.dart';

class JobDetailClient extends StatelessWidget {
  JobDetailClient({super.key}) {
    job = getScreenArgs();
  }

  Job? job;
  final _controller = Get.put(JobDetailClientController());
  bool isAcceptedBid = false;

  @override
  Widget build(BuildContext context) {
    if (job?.status == JobStatus.processing.name) {
      isAcceptedBid = true;
    }
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.imgBackground,
              fit: BoxFit.fill,
            )),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            appBar: MainAppBar().build(context),
            backgroundColor: Colors.transparent,
            body: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.mainColor)),
                  child: Image.network(
                      fit: BoxFit.fitWidth,
                      "https://vtv1.mediacdn.vn/thumb_w/640/562122370168008704/2024/3/7/anh-man-hinh-2024-03-08-luc-004235-17098335314042016473974.png"),
                ),
                space(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Son Tung MTP",
                      style: AppStyles.artistNameStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          "End in:",
                          style: AppStyles.regular,
                        ),
                        Text(
                          "5D:4H:15M",
                          style: AppStyles.timeStyle,
                        )
                      ],
                    )
                  ],
                ),
                space(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Project Music",
                      style: AppStyles.artistNameStyle,
                    ),
                    Text(
                      "Chung ta cua qua khu",
                      style: AppStyles.regular,
                    ),
                  ],
                ),
                space(height: 20),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Bai hat trong chuoi trilogy Chung ta cua hien tai, Chung ta cua tuong lai va Chung ta cua qua khu"),
                ),
                space(height: 10),
                Row(
                  children: [
                    Text(
                      "TOTAL RAISE:",
                      style: AppStyles.headline2Style,
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "\$200",
                      style: AppStyles.timeStyle,
                    ),
                    Text(
                      "/ \$1.000.000",
                      style: AppStyles.regular,
                    ),
                  ],
                ),
                space(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ),
                    space(width: 10),
                    AppTextFormField(
                      textInputType: TextInputType.number,
                      width: 50,
                    ),
                    space(width: 10),
                    Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ),
                    Expanded(child: SizedBox()),
                    AppElevatedButton(
                      label: "Buy",
                      onPressed: () {
                        _controller.onSendBid(job);
                      },
                    )
                  ],
                ),
                space(height: 10),
                Text(
                  "Holders",
                  style: AppStyles.regular,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "1",
                        style: AppStyles.regular,
                      ),
                      Text(
                        "asdfqwadf",
                        style: AppStyles.regular,
                      ),
                      Text(
                        "500Sol",
                        style: AppStyles.regular,
                      )
                    ])
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFinishJobButton(BuildContext context) {
    return AppElevatedButton(
      label: "Finish Job",
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Send Bid",
                            style: TextStyle(color: Colors.white),
                          ),
                          // space(height: 20),
                          // AppTextFormField(
                          //   label: "Price",
                          //   isRequired: true,
                          //   textInputType: TextInputType.number,
                          //   hintText: "0",
                          // ),
                          space(height: 20),
                          AppTextFormField(
                            controller: _controller.proposalController,
                            label: "Proposal",
                            maxLines: 9,
                            hintText: "",
                          ),
                          space(height: 20),
                          AppElevatedButton(
                            width: double.infinity,
                            label: "Send",
                            onPressed: () {
                              _controller.onSendBid(job);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      },
    );
  }

  Widget _buildButtonSendBid(BuildContext context) {
    return AppElevatedButton(
        label: "Send Bid",
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Send Bid",
                              style: TextStyle(color: Colors.white),
                            ),
                            // space(height: 20),
                            // AppTextFormField(
                            //   label: "Price",
                            //   isRequired: true,
                            //   textInputType: TextInputType.number,
                            //   hintText: "0",
                            // ),
                            space(height: 20),
                            AppTextFormField(
                              controller: _controller.proposalController,
                              label: "Proposal",
                              maxLines: 9,
                              hintText: "",
                            ),
                            space(height: 20),
                            AppElevatedButton(
                              width: double.infinity,
                              label: "Send",
                              onPressed: () {
                                _controller.onSendBid(job);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        });
  }
}
