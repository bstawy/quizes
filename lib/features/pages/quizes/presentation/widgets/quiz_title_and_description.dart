import 'package:flutter/material.dart';

import '../../../../../core/config/texts/text_styles.dart';

class QuizTitleAndDescription extends StatelessWidget {
  final String title;
  final String description;

  const QuizTitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font16BlueGreyBold,
        ),
        Text(
          description,
          style: TextStyles.font14GreyRegular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
