import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.search,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.play,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Play',
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.message,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Message',
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.profile),
    activeIcon: _bottomContainer(
      imagePath: ImageRes.profile,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: 'Profile',
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryFourthElementText,
}) {
  return Container(
    width: 15.h,
    height: 15.h,
    child: appImageWithColor(
      iconPath: imagePath,
      color: color,
    ),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    const Home(),
    Center(
      child: appImage(iconPath: ImageRes.search, height: 250, width: 250),
    ),
    Center(
      child: appImage(iconPath: ImageRes.play, height: 250, width: 250),
    ),
    Center(
      child: appImage(iconPath: ImageRes.message, height: 250, width: 250),
    ),
    Center(
      child: appImage(iconPath: ImageRes.profile, height: 250, width: 250),
    ),
  ];
  return screens[index];
}
