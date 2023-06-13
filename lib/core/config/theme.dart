import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: textTheme(),
      useMaterial3: true,
      hintColor: Colors.grey[500],
      primaryColor: const Color(0xff01807E),
      cardColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xffF9F9F9),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff01807E),
          centerTitle: true),
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.white,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.white,
        labelColor: Colors.white,
      ),
      sliderTheme: SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.r),
          trackHeight: 8.r));
  static TextTheme textTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      ),
      titleMedium: TextStyle(
        color: const Color(0xff01807E),
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        color: Colors.grey[700],
        fontSize: 14.sp,
      ),
    );
  }
}
