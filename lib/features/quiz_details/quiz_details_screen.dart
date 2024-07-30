import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/theme/colors_manager.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_app_bar_widget.dart';
import 'widgets/next_button_widget.dart';
import 'widgets/question_widget.dart';
import 'widgets/quiz_duration_and_question_num_widget.dart';

class QuizDetailsScreen extends StatelessWidget {
  static const String routeName = 'quiz-details';
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: "اختبار المعرفة العامة",
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsetsDirectional.only(
                  top: 36.h, bottom: 120.h, start: 32.w, end: 32.w),
              children: [
                const QuizDurationAndQuestionNumWidget(),
                Gap(36.h),
                const StepperWidget(currentStep: 0),
                Gap(36.h),
                const QuestionWidget().setOnlyPadding(0, 18.h, 0, 0),
                const QuestionWidget(),
                const QuestionWidget(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: const NextButtonWidget(
                    finished: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperWidget extends StatelessWidget {
  final int currentStep;
  const StepperWidget({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStep(currentStep == 0),
        Gap(9.w),
        _buildStep(currentStep == 1),
        Gap(9.w),
        _buildStep(currentStep == 2),
      ],
    );
  }

  Widget _buildStep(bool isSelected) {
    return Expanded(
      child: Container(
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: isSelected ? ColorsManager.teal : const Color(0xffCED0D0),
        ),
      ),
    );
  }
}
