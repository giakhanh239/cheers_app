import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:freelance/util/const/app_images.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Container(
        color: AppColors.mainFloorColor,
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.icAppLogo,
              //height: ,
              width: 200,
            ),
            SvgPicture.asset(AppImages.icMenu)
          ],
        ),
      ),
    );
  }
}
