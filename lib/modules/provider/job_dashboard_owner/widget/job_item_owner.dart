import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/common/app_one_color_button.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/routes/routes.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:freelance/util/ultility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class JobItemOwner extends StatelessWidget {
  JobItemOwner({super.key, this.job});

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.mainColor, width: 2)),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppOneColorButton(
                    label: "Junior",
                  ),
                  Text(
                    job?.price.toString() ?? "Negotiable",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              space(height: 10),
              Text(
                job?.name ?? "Unknown",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              space(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: SvgPicture.asset(
                    AppImages.icCompany,
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                  )),
                  space(width: 4),
                  Text(
                    "Comapany name",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              space(height: 10),
              divider(height: 2),
              space(height: 10),
              Text(
                job?.description ?? "Uknown",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              space(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.mainColor.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      "Skill",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.mainColor.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      "Skill",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.mainColor.withOpacity(0.5)),
                    child: Center(
                        child: Text(
                      "Skill",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              space(height: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: AppElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.jobDetailOwner, arguments: job);
                    },
                    label: "Detail",
                    borderRadius: BorderRadius.circular(4),
                  ))
            ]));
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
