import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/config/theme/colors_manager.dart';
import '../../../../core/widgets/quiz_info_widget.dart';
import '../../logic/quiz_details_cubit.dart';

class QuizDurationAndQuestionNumWidget extends StatefulWidget {
  final Duration duration;
  final String questionNum;

  const QuizDurationAndQuestionNumWidget({
    super.key,
    required this.duration,
    required this.questionNum,
  });

  @override
  State<QuizDurationAndQuestionNumWidget> createState() =>
      _QuizDurationAndQuestionNumWidgetState();
}

class _QuizDurationAndQuestionNumWidgetState
    extends State<QuizDurationAndQuestionNumWidget> {
  late Duration remainingDuration;
  late int remainingMinutes;
  late int remainingSeconds;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    remainingDuration = widget.duration;
    remainingMinutes = remainingDuration.inMinutes;
    remainingSeconds = remainingDuration.inSeconds % 60;
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingDuration.inSeconds > 0) {
        remainingDuration = Duration(seconds: remainingDuration.inSeconds - 1);
        remainingMinutes = remainingDuration.inMinutes;
        remainingSeconds = remainingDuration.inSeconds % 60;
        setState(() {});
      } else {
        timer.cancel();
        context.read<QuizDetailsCubit>().setTimesUp();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuizInfoWidget(
          title:
              "$remainingMinutes:${(remainingSeconds).toString().padLeft(2, '0')} دقيقة",
          info: "المدة المتبقية",
          imagePath: "assets/images/finished_duration_image.png",
          titleStyle: TextStyles.font14LightBlueGreyBold.copyWith(
            color: ColorsManager.teal,
          ),
          infoStyle: TextStyles.font14LightBlueGreyBold,
        ),
        const Spacer(),
        BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
          bloc: context.read<QuizDetailsCubit>(),
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.questionNum} / ',
                    style: TextStyles.font20LightBlueGreyBold,
                  ),
                  TextSpan(
                    text: context
                        .read<QuizDetailsCubit>()
                        .answeredQuestions
                        .toString(),
                    style: TextStyles.font20LightBlueGreyBold.copyWith(
                      color: ColorsManager.teal,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
