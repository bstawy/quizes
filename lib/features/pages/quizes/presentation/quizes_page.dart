import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/texts/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../cubit/quizes_cubit.dart';
import 'widgets/cusotm_search_widget.dart';
import 'widgets/quiz_item_widget.dart';

class QuizesPage extends StatelessWidget {
  const QuizesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الإختبارات").setHorizontalPadding(16.w),
          titleTextStyle: TextStyles.font20DarkGreyBold,
          forceMaterialTransparency: true,
        ),
        body: BlocBuilder<QuizesCubit, QuizesState>(
          bloc: context.read<QuizesCubit>()..fetchQuizes(),
          builder: (context, state) {
            if (state is QuizesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizesLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(28.h),
                  const CustomSearchWidget(),
                  Gap(16.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsetsDirectional.only(top: 20.h),
                      itemCount: state.quizes.length,
                      itemBuilder: (context, index) {
                        return QuizItemWidget(quiz: state.quizes[index])
                            .setOnlyPadding(0, 9.h, 0, 0);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ).setHorizontalPadding(36.w),
      ),
    );
  }
}
