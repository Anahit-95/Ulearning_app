import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Widget text24Normal({
  String text = '',
  Color color = AppColors.primaryText,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24.sp,
      fontWeight: fontWeight,
    ),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text16Normal({
    this.text = '',
    this.color = AppColors.primarySecondaryElementText,
    this.fontWeight = FontWeight.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text14Normal({
    this.text = '',
    this.color = AppColors.primaryThrirdElementText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text10Normal({
    this.text = '',
    this.color = AppColors.primaryThrirdElementText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text11Normal({
    this.text = '',
    this.color = AppColors.primaryElementText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

Widget textUnderline({
  String text = 'Your text',
}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
      ),
    ),
  );
}
