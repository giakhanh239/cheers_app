import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton(
      {super.key,
      this.onPressed,
      this.label,
      this.height,
      this.width,
      this.borderRadius});

  final Function? onPressed;
  final String? label;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [AppColors.mainColor, AppColors.secondaryColor])),
      child: ElevatedButton(
        onPressed: () {
          onPressed?.call();
        },
        child: Text(
          label ?? "",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(0, 40),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
      ),
    );
  }
}
