import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/texts/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';

class QuizResultWidget extends StatelessWidget {
  final int score;

  const QuizResultWidget({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 24.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.lightOrange,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/rating_image.png",
            width: 73.w,
            height: 73.h,
          ),
          Gap(18.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أداء رائع',
                style: TextStyles.font18OrangeBold,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '12 / ',
                      style: TextStyles.font18OrangeBold.copyWith(
                        color: ColorsManager.blueGrey,
                      ),
                    ),
                    TextSpan(
                      text: score.toString(),
                      style: TextStyles.font18OrangeBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
