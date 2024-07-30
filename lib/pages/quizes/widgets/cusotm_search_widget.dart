import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/extensions.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        isDense: true, // Used to have full control on padding
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 20.h,
        ),
        hintText: "بحث عن إختبار",
        hintStyle: TextStyles.font16BlueGreyMedium.copyWith(
          color: ColorsManager.blueGrey.withOpacity(0.62),
        ),
        suffixIcon: SvgPicture.asset(
          "assets/icons/search_icon.svg",
        ).setHorizontalPadding(16.w),
        fillColor: ColorsManager.lightTeal,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: ColorsManager.lightGrey.withOpacity(0.32),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: ColorsManager.teal.withOpacity(0.32),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
