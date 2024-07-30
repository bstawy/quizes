import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/quiz_info_widget.dart';
import 'quiz_title_and_description.dart';
import 'view_quiz_button.dart';

class UnfinishedQuizItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final Duration duration;
  final int questionsNumber;

  const UnfinishedQuizItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.questionsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizTitleAndDescription(title: title, description: description),
        Gap(24.h),
        Row(
          children: [
            QuizInfoWidget(
              title: "الأسئلة",
              info: questionsNumber.toString(),
              imagePath: "assets/images/questions_image.png",
            ),
            Gap(18.w),
            QuizInfoWidget(
              title: "مدة الإختبار",
              info: "${duration.inMinutes} دقيقة",
              imagePath: "assets/images/unfinished_duration_image.png",
            ),
            const Spacer(),
            const ViewQuizButton(),
          ],
        ),
      ],
    );
  }
}
