import 'package:flutter/material.dart';
import 'package:freelance/common/app_elevated_button.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/ultility.dart';

class ItemProject extends StatelessWidget {
  const ItemProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.subGradientFloorColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Project A",style: AppStyles.headline2Style,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Reward: \$100.2",style: AppStyles.regular),
              space(width: 20),
              AppElevatedButton(
                label: "Claim",
              )
            ],
          )
        ],
      ),
    );
  }
}
