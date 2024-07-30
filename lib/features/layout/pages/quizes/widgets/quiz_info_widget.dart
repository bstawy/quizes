import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/texts/font_weight_helper.dart';
import '../../../../../core/config/texts/text_styles.dart';

class QuizInfoWidget extends StatelessWidget {
  final String title;
  final String info;
  final String imagePath;
  final TextStyle? titleStyle;
  final TextStyle? infoStyle;

  const QuizInfoWidget({
    super.key,
    required this.title,
    required this.info,
    required this.imagePath,
    this.titleStyle,
    this.infoStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 43.5.w,
          height: 45.h,
        ),
        Gap(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle ??
                  TextStyles.font14LightBlueGreyBold
                      .copyWith(fontWeight: FontWeightHelper.medium),
            ),
            Text(
              info,
              style: infoStyle ?? TextStyles.font14LightBlueGreyBold,
            ),
          ],
        ),
      ],
    );
  }
}
