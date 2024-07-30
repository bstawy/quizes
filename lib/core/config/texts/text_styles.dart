import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors_manager.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font20BlackBold = TextStyle(
    color: ColorsManager.darkGrey,
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Tajawal',
  );

  static TextStyle font16WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Tajawal',
  );
}
