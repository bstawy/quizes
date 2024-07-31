import 'package:flutter/material.dart';

import '../../../core/config/texts/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "الحساب",
          style: TextStyles.font20DarkGreyBold,
        ),
      ),
    );
  }
}
