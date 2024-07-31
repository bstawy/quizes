import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/texts/text_styles.dart';
import '../../../../../core/config/theme/colors_manager.dart';
import '../../../../../core/widgets/quiz_info_widget.dart';
import '../../../../models/quiz_model.dart';
import 'quiz_result_widget.dart';
import 'quiz_title_and_description.dart';
import 'view_quiz_button.dart';

class FinishedQuizItemWidget extends StatelessWidget {
  final QuizModel quiz;

  const FinishedQuizItemWidget({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizTitleAndDescription(
          title: quiz.title,
          description: quiz.description,
        ),
        Gap(24.h),
        QuizResultWidget(
          totalQuestions: quiz.totalQuestions,
          score: quiz.score,
        ),
        Gap(24.h),
        Row(
          children: [
            QuizInfoWidget(
              title: "${quiz.duration.inMinutes} دقيقة",
              info: "إعادة المحاولة",
              imagePath: "assets/images/finished_duration_image.png",
              titleStyle: TextStyles.font14LightBlueGreyBold.copyWith(
                color: ColorsManager.teal,
              ),
              infoStyle: TextStyles.font14LightBlueGreyBold,
            ),
            const Spacer(),
            ViewQuizButton(quiz: quiz),
          ],
        ),
      ],
    );
  }
}
