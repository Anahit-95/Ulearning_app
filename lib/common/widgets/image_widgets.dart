import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage({
  String iconPath = ImageRes.defaultImg,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    iconPath.isEmpty ? ImageRes.defaultImg : iconPath,
    width: width.w,
    height: height.h,
  );
}

Widget appImageWithColor({
  String iconPath = ImageRes.defaultImg,
  double width = 16,
  double height = 16,
  Color color = AppColors.primaryElement,
}) {
  return Image.asset(
    iconPath.isEmpty ? ImageRes.defaultImg : iconPath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
