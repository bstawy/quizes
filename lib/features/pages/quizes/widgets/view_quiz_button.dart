import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../quiz_details/quiz_details_screen.dart';

class ViewQuizButton extends StatelessWidget {
  const ViewQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to Quiz Details Page
        context.pushNamed(QuizDetailsScreen.routeName);
      },
      child: SvgPicture.asset("assets/icons/next_arrow_icon.svg"),
    );
  }
}
