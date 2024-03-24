import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/theme/app_styles.dart';
import 'package:freelance/util/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance/util/ultility.dart';

class BigViewProject extends StatelessWidget {
  const BigViewProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.mainGradientColor,
          borderRadius: BorderRadius.circular(5)),
      child: _buildBody(),
    );
  }

  Row _buildBody() {
    return Row(
      children: [
        Image.asset(
          width: 100,
          AppImages.imgRobot,
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Con mua ngang qua",
                style: AppStyles.headline2Style,
              ),
              space(height: 10),
              Text(
                "Mot bai hat cua Son Tung MTP",
                textAlign: TextAlign.start,
                style: AppStyles.regular,
              )
            ],
          ),
        )
      ],
    );
  }
}
