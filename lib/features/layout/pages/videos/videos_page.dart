import 'package:flutter/material.dart';

import '../../../../core/config/texts/text_styles.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "الفيديوهات",
          style: TextStyles.font20BlackBold,
        ),
      ),
    );
  }
}
