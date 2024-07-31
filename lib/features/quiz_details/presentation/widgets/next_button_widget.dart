import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../../models/quiz_model.dart';
import '../../../success/success_screen.dart';
import '../../logic/quiz_details_cubit.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
      bloc: context.read<QuizDetailsCubit>(),
      buildWhen: (previous, current) {
        if (current is QuizDetailsFinishedAllQuestions) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          width: 1.sw,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.0, 0.5],
              colors: [
                const Color(0xffEEEDED).withOpacity(0.0),
                const Color(0xffEEEDED),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: MaterialButton(
            onPressed: context.read<QuizDetailsCubit>().quizFinished
                ? () {
                    final QuizModel quiz =
                        context.read<QuizDetailsCubit>().quiz!;
                    context.pushNamed(SuccessScreen.routeName, arguments: quiz);
                  }
                : null,
            minWidth: double.infinity,
            color: ColorsManager.teal,
            elevation: 0,
            disabledColor: const Color(0xff039080),
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 20.h,
              horizontal: 18.w,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Text(
              "التالي",
              style: TextStyles.font14LightBlueGreyBold.copyWith(
                color: Colors.white,
              ),
            ),
          ).setOnlyPadding(18.h, 36.h, 36.w, 36.w),
        );
      },
    );
  }
}
