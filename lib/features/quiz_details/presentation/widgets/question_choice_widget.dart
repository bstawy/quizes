import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../models/question_model.dart';
import '../../logic/quiz_details_cubit.dart';

class QuestionChoiceWidget extends StatelessWidget {
  final QuestionModel question;
  final int choiceIndex;
  final String choice;

  const QuestionChoiceWidget({
    super.key,
    required this.question,
    required this.choiceIndex,
    required this.choice,
  });

  @override
  Widget build(BuildContext context) {
    final QuizDetailsCubit quizDetailsCubit = context.read<QuizDetailsCubit>();

    return Row(
      children: [
        BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
          bloc: quizDetailsCubit,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (question.userAnswerIndex == null) {
                  quizDetailsCubit.checkAnswer(question.id, choiceIndex);
                }
              },
              child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: question.userAnswerIndex == null ||
                          question.userAnswerIndex != choiceIndex
                      ? Colors.white
                      : question.isCorrect!
                          ? ColorsManager.teal
                          : ColorsManager.red,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: question.userAnswerIndex == null ||
                            question.userAnswerIndex != choiceIndex
                        ? ColorsManager.lightBlueGrey
                        : question.isCorrect!
                            ? const Color(0xff04B9A5)
                            : const Color(0xffEB5050),
                    width: 1.5.w,
                  ),
                ),
                alignment: Alignment.center,
                child: question.userAnswerIndex == null ||
                        question.userAnswerIndex != choiceIndex
                    ? null
                    : question.isCorrect!
                        ? SvgPicture.asset("assets/icons/correct_icon.svg")
                        : SvgPicture.asset("assets/icons/wrong_icon.svg"),
              ),
            );
          },
        ),
        Gap(9.w),
        Text(
          choice,
          style: TextStyles.font14LightBlueGreyBold,
        ),
      ],
    );
  }
}
