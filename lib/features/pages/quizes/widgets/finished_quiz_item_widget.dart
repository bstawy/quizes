import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/widgets/quiz_info_widget.dart';
import 'quiz_result_widget.dart';
import 'quiz_title_and_description.dart';
import 'view_quiz_button.dart';

class FinishedQuizItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final int score;
  final Duration duration;

  const FinishedQuizItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.score,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizTitleAndDescription(title: title, description: description),
        Gap(24.h),
        QuizResultWidget(score: score),
        Gap(24.h),
        Row(
          children: [
            QuizInfoWidget(
              title: "${duration.inMinutes} دقيقة",
              info: "إعادة المحاولة",
              imagePath: "assets/images/finished_duration_image.png",
              titleStyle: TextStyles.font14LightBlueGreyBold.copyWith(
                color: ColorsManager.teal,
              ),
              infoStyle: TextStyles.font14LightBlueGreyBold,
            ),
            const Spacer(),
            const ViewQuizButton(),
          ],
        ),
      ],
    );
  }
}
