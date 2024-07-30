import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final double? width, height, horizontalPadding, verticalPadding, borderRadius;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.width,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.62),
            Colors.white,
          ],
        ),
      ),
      child: GestureDetector(
        onTap: onPressed ?? () => Navigator.of(context).pop(),
        child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SvgPicture.asset("assets/icons/next_arrow_icon.svg")),
      ),
    );
  }
}
