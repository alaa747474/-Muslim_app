import 'package:dubisign_task/core/config/app_router.dart';
import 'package:dubisign_task/core/config/theme.dart';
import 'package:dubisign_task/core/constants/app_routes.dart';
import 'package:dubisign_task/core/service/sevice_locator.dart';
import 'package:dubisign_task/features/surahs/presentation/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt.get<SurahCubit>()..getAllSurahs(),
          child: MaterialApp(
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("ar"),
            ],
            locale: const Locale("ar"),
            debugShowCheckedModeBanner: false,
            title: 'Musilm App',
            theme: AppTheme.theme(),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRoutes.surahsScreen,
          ),
        );
      },
    );
  }
}
