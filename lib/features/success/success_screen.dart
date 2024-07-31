import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/texts/text_styles.dart';
import '../../core/config/theme/colors_manager.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/quiz_info_widget.dart';
import '../models/quiz_model.dart';
import 'widgets/action_button_widget.dart';

class SuccessScreen extends StatefulWidget {
  static const String routeName = 'success';
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late QuizModel quiz;
  late String quizDate;

  @override
  void initState() {
    super.initState();
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;

    quizDate = "$day-$month-$year";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    quiz = ModalRoute.of(context)!.settings.arguments as QuizModel;

    setState(() {
      debugPrint("QuizModel: ${quiz.score}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(
                top: 135.h,
                start: 36.w,
                end: 36.w,
              ),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 36.w,
                vertical: 36.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Image.asset(
                        "assets/images/success_cartoon_image.png",
                        width: 81.w,
                        height: 85.h,
                      ),
                      Image.asset(
                        "assets/images/success_score_image.png",
                        width: 170.w,
                        height: 170.h,
                      ).setOnlyPadding(65.h, 0, 0, 0),
                      Positioned(
                        top: 170.h,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${quiz.totalQuestions} / ',
                                style: TextStyles.font18OrangeBold.copyWith(
                                  fontSize: 20.sp,
                                  color: ColorsManager.blueGrey,
                                ),
                              ),
                              TextSpan(
                                text: quiz.score.toString(),
                                style: TextStyles.font18OrangeBold.copyWith(
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Text(
                    'أداء رائع',
                    style: TextStyles.font20DarkGreyBold,
                  ),
                  Gap(36.h),
                  Container(
                    width: double.infinity,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.lightGrey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  Gap(36.h),
                  QuizInfoWidget(
                    title: "نتيجة الاختبار",
                    info: quiz.title,
                    imagePath: "assets/images/questions_image.png",
                  ),
                  Gap(18.h),
                  QuizInfoWidget(
                    title: "تاريخ الاختبار",
                    info: quizDate,
                    imagePath: "assets/images/exam_date_image.png",
                  ),
                ],
              ),
            ),
            const Spacer(),
            const ActionButtonsWidget(),
            Gap(36.h),
          ],
        ),
      ),
    );
  }
}
