import 'package:flutter/material.dart';

import '../../core/config/texts/text_styles.dart';

class MettingsPage extends StatelessWidget {
  const MettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "الإجتماعات",
          style: TextStyles.font20BlackBold,
        ),
      ),
    );
  }
}
