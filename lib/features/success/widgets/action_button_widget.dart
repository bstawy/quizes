import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../layout/layout_screen.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            context.pop();
          },
          minWidth: double.infinity,
          color: ColorsManager.teal,
          elevation: 0,
          disabledColor: const Color(0xff039080),
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.h,
            horizontal: 18.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            "إعادة المحاولة",
            style: TextStyles.font14LightBlueGreyBold.copyWith(
              color: Colors.white,
            ),
          ),
        ).setHorizontalPadding(36.h),
        Gap(9.h),
        MaterialButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(
              LayoutScreen.routeName,
              predicate: (route) => false,
            );
          },
          minWidth: double.infinity,
          elevation: 0,
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 20.h,
            horizontal: 18.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(
              color: ColorsManager.teal,
              width: 1.5.r,
            ),
          ),
          child: Text(
            "لا أرغب حالياً",
            style: TextStyles.font14LightBlueGreyBold.copyWith(
              color: ColorsManager.teal,
            ),
          ),
        ).setHorizontalPadding(36.h),
      ],
    );
  }
}
