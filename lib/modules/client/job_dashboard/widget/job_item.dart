import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/app_one_color_button.dart';
import 'package:freelance/common/gradient_progress_bar.dart';
import 'package:freelance/common/gradient_text.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class JobItem extends StatelessWidget {
  JobItem({super.key, this.job, this.percent, this.isEnded, this.name});

  final int? percent;

  final bool? isEnded;

  final String? name;

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.jobDetailClient);
      },
      child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.subGradientFloorColor,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name ?? "Project B",
                      style: AppStyles.headline2Style,
                    ),
                    Text(
                      isEnded == true ? "0" : "5D:12H:30M",
                      style: AppStyles.timeStyle,
                    )
                  ],
                ),
                space(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Son tung MTP",
                      style: AppStyles.artistNameStyle,
                    ),
                    Text(
                      "Rasing 5000\$",
                      style: AppStyles.regular2,
                    )
                  ],
                ),
                space(height: 10),
                Row(
                  children: [
                    GradientText(
                      "${percent ?? 50}/100",
                      style: AppStyles.progressStyle,
                      gradient: AppColors.gradientTextColor,
                    ),
                    space(width: 10),
                    Expanded(
                      child: GradientProgressBar(
                        percent: percent ?? 50,
                        gradient: AppColors.gradientTextColor,
                        backgroundColor: AppColors.progressBackGround,
                      ),
                    ),
                  ],
                )
              ])),
    );
  }

  Widget get buildElevatedButtonWidget => Container(
      height: 23,
      width: double.maxFinite,
      // margin: margin,
      child: ElevatedButton(
          onPressed: () {},
          //style: buttonStyle,
          //onPressed: isDisabled ?? false ull oPressed ?? ( ) {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "skill",
                )
              ])));
}
// /// Section Widget
// Widget _buildJunior() {
//   return CustomElevatedButton(
//       height: 20.v,
//       width: 67.h,
//       text: "lbl_junior".tr,
//       buttonStyle: CustomButtonStyles.fillPurple,
//       ;
//
//   }
