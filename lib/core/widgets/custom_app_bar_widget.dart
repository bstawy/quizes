import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/texts/text_styles.dart';
import '../helpers/extensions/extensions.dart';
import 'custom_back_button.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CustomBackButton(),
          Gap(18.w),
          Text(
            "اختبار المعرفة العامة",
            style: titleStyle ?? TextStyles.font16BlueGreyBold,
          ),
        ],
      ).setOnlyPadding(0, 0, 16.w, 0),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0.h);
}
