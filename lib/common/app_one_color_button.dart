import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';

class AppOneColorButton extends StatelessWidget {
  AppOneColorButton(
      {super.key,
      this.onPressed,
      this.label,
      this.height,
      this.width,
      this.color});

  final Function? onPressed;
  final String? label;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color ?? AppColors.mainColor),
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
