import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../models/quiz_model.dart';
import '../../../../quiz_details/presentation/quiz_details_screen.dart';

class ViewQuizButton extends StatelessWidget {
  final QuizModel quiz;
  const ViewQuizButton({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(QuizDetailsScreen.routeName, arguments: quiz);
      },
      child: SvgPicture.asset("assets/icons/next_arrow_icon.svg"),
    );
  }
}
