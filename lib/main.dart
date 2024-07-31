import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/theme/app_theme.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'features/layout/layout_screen.dart';
import 'features/quiz_details/logic/quiz_details_cubit.dart';
import 'features/quiz_details/presentation/quiz_details_screen.dart';
import 'features/success/success_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Quizes',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        initialRoute: LayoutScreen.routeName,
        routes: {
          LayoutScreen.routeName: (context) => const LayoutScreen(),
          QuizDetailsScreen.routeName: (context) =>
              BlocProvider<QuizDetailsCubit>(
                create: (context) => QuizDetailsCubit(),
                child: const QuizDetailsScreen(),
              ),
          SuccessScreen.routeName: (context) => const SuccessScreen(),
        },
      ),
    );
  }
}
