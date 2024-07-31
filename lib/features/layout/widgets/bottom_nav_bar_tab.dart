import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';

PersistentTabConfig bottomNavBarTab({
  required Widget screen,
  required String title,
  required String iconPath,
  required String inactiveIconPath,
}) {
  return PersistentTabConfig(
    screen: screen,
    item: ItemConfig(
      title: "\t\t$title",
      textStyle: TextStyles.font16WhiteBold,
      icon: SvgPicture.asset(
        iconPath,
        width: 26.w,
        height: 26.h,
      ),
      inactiveIcon: SvgPicture.asset(
        inactiveIconPath,
        width: 26.w,
        height: 26.h,
      ),
      activeForegroundColor: Colors.white,
      activeColorSecondary: ColorsManager.teal,
    ),
  );
}
