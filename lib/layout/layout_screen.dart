import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../core/config/texts/text_styles.dart';
import '../core/config/theme/colors_manager.dart';
import 'widgets/bottom_nav_bar_tab.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
    //context.read<LayoutCubit>().controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PersistentTabView(
        controller: controller,
        navBarHeight: 122.h,
        navBarOverlap: const NavBarOverlap.none(),
        tabs: [
          bottomNavBarTab(
            screen: Scaffold(
              body: Center(
                child: Text(
                  "الرئيسية",
                  style: TextStyles.font20BlackBold,
                ),
              ),
            ),
            iconPath: "assets/icons/home_unselected_icon.svg",
            inactiveIconPath: "assets/icons/home_unselected_icon.svg",
            title: "الرئيسية",
          ),
          bottomNavBarTab(
            screen: Scaffold(
              body: Center(
                child: Text(
                  "الفيديوهات",
                  style: TextStyles.font20BlackBold,
                ),
              ),
            ),
            iconPath: "assets/icons/videos_unselected_icon.svg",
            inactiveIconPath: "assets/icons/videos_unselected_icon.svg",
            title: "الفيديوهات",
          ),
          bottomNavBarTab(
            screen: Scaffold(
              body: Center(
                child: Text(
                  "الإختبارات",
                  style: TextStyles.font20BlackBold,
                ),
              ),
            ),
            iconPath: "assets/icons/exams_selected_icon.svg",
            inactiveIconPath: "assets/icons/exams_selected_icon.svg",
            title: "الإختبارات",
          ),
          bottomNavBarTab(
            screen: Scaffold(
              body: Center(
                child: Text(
                  "الإجتماعات",
                  style: TextStyles.font20BlackBold,
                ),
              ),
            ),
            iconPath: "assets/icons/metting_unselected_icon.svg",
            inactiveIconPath: "assets/icons/metting_unselected_icon.svg",
            title: "الإجتماعات",
          ),
          bottomNavBarTab(
            screen: Scaffold(
              body: Center(
                child: Text(
                  "الحساب",
                  style: TextStyles.font20BlackBold,
                ),
              ),
            ),
            iconPath: "assets/icons/profile_unselected_icon.svg",
            inactiveIconPath: "assets/icons/profile_unselected_icon.svg",
            title: "الحساب",
          ),
        ],
        navBarBuilder: (navBarConfig) {
          return Style8BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              color: ColorsManager.blueGrey,
              border: Border.all(width: 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shape: BoxShape.rectangle,
            ),
          );
        },
      ),
    );
  }
}
