import 'package:flutter/material.dart';

import 'colors_manager.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.lightGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.lightGrey,
      centerTitle: false,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.teal,
      primary: ColorsManager.teal,
      surface: ColorsManager.lightGrey,
    ),
    fontFamily: 'Montserrat',
  );
}
