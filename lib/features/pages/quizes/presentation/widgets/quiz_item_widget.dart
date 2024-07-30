import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/quiz_model.dart';
import 'finished_quiz_item_widget.dart';
import 'unfinished_quiz_item_widget.dart';

class QuizItemWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizItemWidget({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: quiz.isCompleted
          ? FinishedQuizItemWidget(quiz: quiz)
          : UnfinishedQuizItemWidget(quiz: quiz),
    );
  }
}
