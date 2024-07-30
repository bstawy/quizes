import 'package:flutter/material.dart';

import '../../../core/config/texts/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "الرئيسية",
          style: TextStyles.font20DarkGreyBold,
        ),
      ),
    );
  }
}
