import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import 'question_choice_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 18.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 18.h,
              horizontal: 18.w,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.lightBlueGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: Text(
              "السؤال الأول",
              style: TextStyles.font14LightBlueGreyBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Gap(18.h),
          Text(
            "ما هو العنصر الكيميائي؟",
            style: TextStyles.font16DarkGreyBold,
          ),
          Gap(18.h),
          for (int i = 0; i < 4; i++) ...[
            const QuestionChoiceWidget(),
            Gap(9.h),
          ],
          Gap(18.h),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff03BDA8).withOpacity(0.32),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 2.4),
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: () {},
              color: ColorsManager.teal,
              elevation: 0,
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 10.h,
                horizontal: 18.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/retry_icon.svg"),
                  Gap(8.w),
                  Text(
                    "أعد المحاولة",
                    style: TextStyles.font14LightBlueGreyBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
