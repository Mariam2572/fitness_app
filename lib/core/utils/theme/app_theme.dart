import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
   
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainRed,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    ),
    

     textTheme: TextTheme(
    displayLarge: GoogleFonts.balooThambi2(fontSize: 32, fontWeight: FontWeight.normal), // textStyle32
    displayMedium: GoogleFonts.balooThambi2(fontSize: 30, fontWeight: FontWeight.normal), // textStyle30
    displaySmall: GoogleFonts.balooThambi2(fontSize: 28, fontWeight: FontWeight.normal), // textStyle28
    headlineMedium: GoogleFonts.balooThambi2(fontSize: 24, fontWeight: FontWeight.normal), // textStyle24
    headlineSmall: GoogleFonts.balooThambi2(fontSize: 22, fontWeight: FontWeight.normal), // textStyle22
    titleLarge: GoogleFonts.balooThambi2(fontSize: 20, fontWeight: FontWeight.normal), // textStyle20
    titleMedium: GoogleFonts.balooThambi2(fontSize: 19, fontWeight: FontWeight.normal), // textStyle19
    titleSmall: GoogleFonts.balooThambi2(fontSize: 18, fontWeight: FontWeight.normal), // textStyle18
    bodyLarge: GoogleFonts.balooThambi2(fontSize: 16, fontWeight: FontWeight.normal), // textStyle16
    bodyMedium: GoogleFonts.balooThambi2(fontSize: 14, fontWeight: FontWeight.normal), // textStyle14
    bodySmall: GoogleFonts.balooThambi2(fontSize: 12, fontWeight: FontWeight.normal), // textStyle12
    labelLarge: GoogleFonts.balooThambi2(fontSize: 11, fontWeight: FontWeight.normal), // textStyle11
    labelMedium: GoogleFonts.balooThambi2(fontSize: 10, fontWeight: FontWeight.normal), // textStyle10
    labelSmall: GoogleFonts.balooThambi2(fontSize: 20, fontWeight: FontWeight.w400),  
    headlineLarge: GoogleFonts.balooThambi2(fontSize: 44, fontWeight: FontWeight.normal),
    
     
    
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
