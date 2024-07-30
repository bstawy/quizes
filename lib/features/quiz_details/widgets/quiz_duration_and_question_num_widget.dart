import 'package:flutter/material.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/widgets/quiz_info_widget.dart';

class QuizDurationAndQuestionNumWidget extends StatelessWidget {
  const QuizDurationAndQuestionNumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuizInfoWidget(
          title: "30:00",
          info: "المدة المتبقية",
          imagePath: "assets/images/finished_duration_image.png",
          titleStyle: TextStyles.font14LightBlueGreyBold.copyWith(
            color: ColorsManager.teal,
          ),
          infoStyle: TextStyles.font14LightBlueGreyBold,
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '12 / ',
                style: TextStyles.font20LightBlueGreyBold,
              ),
              TextSpan(
                text: 1.toString(),
                style: TextStyles.font20LightBlueGreyBold.copyWith(
                  color: ColorsManager.teal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
