import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'finished_quiz_item_widget.dart';
import 'unfinished_quiz_item_widget.dart';

class QuizItemWidget extends StatelessWidget {
  final bool quizStatus;
  const QuizItemWidget({super.key, required this.quizStatus});

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
      child: quizStatus
          ? const FinishedQuizItemWidget(
              title: "اختبار المعرفة العامة",
              description: "غطي مجموعة متنوعة من الأسئلة في مجالات متعددة",
              score: 9,
              duration: Duration(minutes: 30),
            )
          : const UnfinishedQuizItemWidget(
              title: "إختبار مادة الرياضيات الأساسية",
              description:
                  "أسئلة متنوعة في الرياضيات تتراوح بين الحساب الأساسية",
              duration: Duration(minutes: 45),
              questionsNumber: 12,
            ),
    );
  }
}
