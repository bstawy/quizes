import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../../../core/widgets/custom_app_bar_widget.dart';
import '../../models/quiz_model.dart';
import '../logic/quiz_details_cubit.dart';
import 'widgets/next_button_widget.dart';
import 'widgets/question_widget.dart';
import 'widgets/quiz_duration_and_question_num_widget.dart';
import 'widgets/stepper_widget.dart';

class QuizDetailsScreen extends StatelessWidget {
  static const String routeName = 'quiz-details';
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizModel quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;
    print(quiz);
    context.read<QuizDetailsCubit>().setQuestions(quiz.questions);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBarWidget(title: quiz.title),
        body: BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
          bloc: context.read<QuizDetailsCubit>(),
          builder: (context, state) {
            if (state is QuizDetailsTimesUp) {
              return Center(
                child: Text(
                  'Times Up',
                  style: TextStyles.font20DarkGreyBold,
                ),
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    QuizDurationAndQuestionNumWidget(
                      duration: quiz.duration,
                      questionNum: quiz.totalQuestions.toString(),
                    ),
                    Gap(36.h),
                    const StepperWidget(),
                    Gap(36.h),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 80.h),
                          itemCount: quiz.totalQuestions,
                          itemBuilder: (context, index) {
                            return QuestionWidget(
                              question: quiz.questions[index],
                            ).setOnlyPadding(0, 18.h, 0, 0);
                          }),
                    ),
                  ],
                ).setOnlyPadding(36.h, 36.h, 36.w, 36.w),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: const NextButtonWidget(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
