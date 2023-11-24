import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
 * PreferredSize widget gives you a height or space from the appbar downwards and we 
 * can put child in the given space
*/

AppBar buildAppBar({String title = ''}) {
  return AppBar(
    title: Text16Normal(
      text: title,
      color: AppColors.primaryText,
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(.3),
        height: 1,
      ),
    ),
  );
}
