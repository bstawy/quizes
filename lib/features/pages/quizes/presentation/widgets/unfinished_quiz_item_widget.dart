import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/quiz_info_widget.dart';
import '../../../../models/quiz_model.dart';
import 'quiz_title_and_description.dart';
import 'view_quiz_button.dart';

class UnfinishedQuizItemWidget extends StatelessWidget {
  final QuizModel quiz;

  const UnfinishedQuizItemWidget({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizTitleAndDescription(
          title: quiz.title,
          description: quiz.description,
        ),
        Gap(24.h),
        Row(
          children: [
            QuizInfoWidget(
              title: "الأسئلة",
              info: quiz.totalQuestions.toString(),
              imagePath: "assets/images/questions_image.png",
            ),
            Gap(18.w),
            QuizInfoWidget(
              title: "مدة الإختبار",
              info: "${quiz.duration.inMinutes} دقيقة",
              imagePath: "assets/images/unfinished_duration_image.png",
            ),
            const Spacer(),
            ViewQuizButton(quiz: quiz),
          ],
        ),
      ],
    );
  }
}
