import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../models/question_model.dart';
import '../../logic/quiz_details_cubit.dart';
import 'question_choice_widget.dart';

class QuestionWidget extends StatelessWidget {
  final QuestionModel question;

  const QuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 18.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 18.h,
              horizontal: 18.w,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.lightBlueGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: Text(
              question.title,
              style: TextStyles.font14LightBlueGreyBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Gap(18.h),
          Text(
            question.question,
            style: TextStyles.font16DarkGreyBold,
          ),
          Gap(18.h),
          for (int i = 0; i < 4; i++) ...[
            QuestionChoiceWidget(
              question: question,
              choice: question.options[i],
              choiceIndex: i,
            ),
            Gap(9.h),
          ],
          Visibility(
            visible: question.isCorrect == false,
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 18.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff03BDA8).withOpacity(0.32),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 2.4),
                  ),
                ],
              ),
              child: MaterialButton(
                onPressed: () {
                  context.read<QuizDetailsCubit>().clearAnswer(question.id);
                },
                color: ColorsManager.teal,
                elevation: 0,
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 10.h,
                  horizontal: 18.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/retry_icon.svg"),
                    Gap(8.w),
                    Text(
                      "أعد المحاولة",
                      style: TextStyles.font14LightBlueGreyBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
