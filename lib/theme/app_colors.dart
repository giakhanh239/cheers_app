import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const mainColor = Color(0XFFA56FFD);
  static const mainColor2 = Color.fromRGBO(238, 70, 211, 1);
  static const secondaryColor = Color(0XFFC885FE);

  static const mainLabelColor = Colors.white;

  static const mainFloorColor = Color.fromRGBO(8, 1, 52, 1);

  static const timeColor = Color.fromRGBO(39, 209, 170, 1);
  static const progressBackGround = Color.fromRGBO(57, 53, 86, 1);
  static const bottomBarColor = Color.fromRGBO(157, 156, 175, 0.2);

  /// gradient
  static var mainGradientColor = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      transform: GradientRotation(50),
      colors: [
        Color.fromRGBO(128, 0, 255, 1),
        Color.fromRGBO(212, 0, 135, 1),
        Color.fromRGBO(255, 214, 0, 1)
      ].reversed.toList());

  static var subGradientFloorColor = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      transform: GradientRotation(50),
      colors: [
        Color.fromRGBO(1, 109, 176, 0.2),
        Color.fromRGBO(1, 255, 202, 0.2),
      ].reversed.toList());

  static var gradientTextColor = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      transform: GradientRotation(50),
      colors: [
        Color.fromRGBO(1, 109, 176, 1),
        Color.fromRGBO(1, 255, 202, 1),
      ].reversed.toList());
}
