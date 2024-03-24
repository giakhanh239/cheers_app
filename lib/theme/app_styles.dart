import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';

class AppStyles {
  static const headline1Style =
      TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);
  static const headline2Style =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  static const headline3Style =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);
  static const regular = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
  static const regular2 =
      TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600);

  static const timeStyle = TextStyle(
      color: AppColors.timeColor, fontSize: 13, fontWeight: FontWeight.w600);

  static const artistNameStyle = TextStyle(
      color: AppColors.mainColor2, fontSize: 13, fontWeight: FontWeight.w600);

  static const progressStyle =
      TextStyle(fontSize: 13, fontWeight: FontWeight.w600);
}
