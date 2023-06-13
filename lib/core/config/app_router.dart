import 'package:dubisign_task/core/constants/app_routes.dart';
import 'package:dubisign_task/features/surahs/data/models/surah.dart';
import 'package:dubisign_task/features/surahs/presentation/screens/surah_details_screen.dart';
import 'package:dubisign_task/features/surahs/presentation/screens/surahs_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.surahDetailsScreen:
      final surah=settings.arguments as Surah;
        return MaterialPageRoute(builder: (_) => SurahDetailsScreen(surah: surah,));
      case AppRoutes.surahsScreen:
        return MaterialPageRoute(builder: (_) => const SurahsScreen());
    }
    return null;
  }
}
