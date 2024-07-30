import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/texts/text_styles.dart';
import '../../../core/config/theme/colors_manager.dart';
import '../../../core/helpers/extensions/extensions.dart';

class NextButtonWidget extends StatelessWidget {
  final bool finished;

  const NextButtonWidget({
    super.key,
    required this.finished,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.0, 0.5],
          colors: [
            const Color(0xffEEEDED).withOpacity(0.0),
            const Color(0xffEEEDED),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: MaterialButton(
        onPressed: finished ? () {} : null,
        minWidth: double.infinity,
        color: ColorsManager.teal,
        elevation: 0,
        disabledColor: const Color(0xff039080),
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.h,
          horizontal: 18.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Text(
          "التالي",
          style: TextStyles.font14LightBlueGreyBold.copyWith(
            color: Colors.white,
          ),
        ),
      ).setOnlyPadding(18.h, 36.h, 36.w, 36.w),
    );
  }
}
