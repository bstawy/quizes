import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';

class QuestionChoiceWidget extends StatelessWidget {
  const QuestionChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34.w,
          height: 34.h,
          decoration: BoxDecoration(
            color: ColorsManager.teal,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: const Color(0xff04B9A5), //ColorsManager.lightBlueGrey,
              width: 1.5.w,
            ),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset("assets/icons/correct_icon.svg"),
        ),
        Gap(9.w),
        Text(
          "أ) 72",
          style: TextStyles.font14LightBlueGreyBold,
        ),
      ],
    );
  }
}
