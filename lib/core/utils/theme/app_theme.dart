import 'package:fitness_app/core/utils/responsive/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainRed,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, responsiveHeight(40)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFD9D9D9),
        side: const BorderSide(color: AppColors.mainRed),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(),
      labelStyle: const TextStyle(color: AppColors.neutral5, fontSize: 16),
      suffixIconColor: AppColors.neutral5,
      border: OutlineInputBorder(
        // gapPadding: 3,
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: AppColors.neutral5,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.neutral5),
        // gapPadding: 10
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.neutral5),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.mainRed,
      unselectedItemColor: AppColors.neutral5,
      backgroundColor: AppColors.neutral90,
      type: BottomNavigationBarType.fixed,

      elevation: 0,
    ),
  );
}
