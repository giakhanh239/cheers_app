import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/theme/app_colors.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

Widget space({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget divider({double? height, double? width, Color? color}) {
  return Container(
    height: height ?? 1,
    width: width,
    color: color ?? AppColors.mainColor,
  );
}
Widget indicator(int currentItem){
  return PageViewDotIndicator(
      currentItem: currentItem,
      count: 3,
      unselectedColor: Colors.white,
      selectedColor: AppColors.mainColor,
      size: const Size(12, 12),
      unselectedSize: const Size(8, 8),
      duration: const Duration(milliseconds: 200),
      margin:
      const EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      fadeEdges: false,
      boxShape: BoxShape.circle,
      //defaults to circle
      //only for rectangle shape
      onItemClicked: (index) {});
}