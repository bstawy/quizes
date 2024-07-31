import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../core/config/theme/colors_manager.dart';
import '../pages/home/home_page.dart';
import '../pages/mettings/mettings_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/quizes/cubit/quizes_cubit.dart';
import '../pages/quizes/presentation/quizes_page.dart';
import '../pages/videos/videos_page.dart';
import 'widgets/bottom_nav_bar_tab.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout';
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PersistentTabView(
        controller: controller,
        navBarHeight: 122.h,
        navBarOverlap: const NavBarOverlap.none(),
        backgroundColor: ColorsManager.lightGrey,
        tabs: [
          bottomNavBarTab(
            screen: const HomePage(),
            iconPath: "assets/icons/home_unselected_icon.svg",
            inactiveIconPath: "assets/icons/home_unselected_icon.svg",
            title: "الرئيسية",
          ),
          bottomNavBarTab(
            screen: const VideosPage(),
            iconPath: "assets/icons/videos_unselected_icon.svg",
            inactiveIconPath: "assets/icons/videos_unselected_icon.svg",
            title: "الفيديوهات",
          ),
          bottomNavBarTab(
            screen: BlocProvider<QuizesCubit>(
              create: (context) => QuizesCubit(),
              child: const QuizesPage(),
            ),
            iconPath: "assets/icons/exams_selected_icon.svg",
            inactiveIconPath: "assets/icons/exams_selected_icon.svg",
            title: "الإختبارات",
          ),
          bottomNavBarTab(
            screen: const MettingsPage(),
            iconPath: "assets/icons/metting_unselected_icon.svg",
            inactiveIconPath: "assets/icons/metting_unselected_icon.svg",
            title: "الإجتماعات",
          ),
          bottomNavBarTab(
            screen: const ProfilePage(),
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
