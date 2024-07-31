import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors_manager.dart';
import '../../logic/quiz_details_cubit.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizDetailsCubit quizDetailsCubit = context.read<QuizDetailsCubit>();

    return BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
      bloc: quizDetailsCubit,
      buildWhen: (previous, current) {
        return current is QuizDetailsAnsweredQuestions;
      },
      builder: (context, state) {
        return Row(
          children: [
            _buildStep(quizDetailsCubit.answeredQuestions >=
                (quizDetailsCubit.questions!.length) / 3),
            Gap(9.w),
            _buildStep(quizDetailsCubit.answeredQuestions >=
                (quizDetailsCubit.questions!.length) / 2),
            Gap(9.w),
            _buildStep(quizDetailsCubit.answeredQuestions ==
                (quizDetailsCubit.questions!.length)),
          ],
        );
      },
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
