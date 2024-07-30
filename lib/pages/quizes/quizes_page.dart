import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/texts/text_styles.dart';
import '../../core/helpers/extensions/extensions.dart';
import 'widgets/cusotm_search_widget.dart';
import 'widgets/quiz_item_widget.dart';

class QuizesPage extends StatelessWidget {
  QuizesPage({super.key});

  final List<bool> quizesStatus = [true, false, true, false, true];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(28.h),
            const CustomSearchWidget(),
            Gap(16.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsetsDirectional.only(top: 20.h),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return QuizItemWidget(quizStatus: quizesStatus[index])
                      .setOnlyPadding(0, 9.h, 0, 0);
                },
              ),
            ),
          ],
        ).setHorizontalPadding(36.w),
      ),
    );
  }
}
