import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/texts/text_styles.dart';
import '../../core/helpers/extensions/extensions.dart';
import 'widgets/cusotm_search_widget.dart';

class QuizesPage extends StatelessWidget {
  const QuizesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الإختبارات").setHorizontalPadding(16.w),
          titleTextStyle: TextStyles.font20BlackBold,
          forceMaterialTransparency: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(28.h),
            const CustomSearchWidget(),
          ],
        ).setHorizontalPadding(36.w),
      ),
    );
  }
}
