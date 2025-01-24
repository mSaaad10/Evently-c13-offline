import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      appBarTheme: const AppBarTheme(
          color: ColorsManager.white,
          iconTheme: IconThemeData(color: ColorsManager.black)),
      scaffoldBackgroundColor: ColorsManager.white,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.inter(
            color: ColorsManager.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.grey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.red, width: 1),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: ColorsManager.primary,
              splashFactory: NoSplash.splashFactory,
              textStyle: GoogleFonts.inter(
                decoration: TextDecoration.underline,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primary,
              foregroundColor: ColorsManager.white,
              textStyle:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ))),
      textTheme: TextTheme(
          bodySmall: GoogleFonts.inter(
              fontSize: 16,
              color: ColorsManager.black,
              fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.inter(
              fontSize: 20,
              color: ColorsManager.primary,
              fontWeight: FontWeight.w500)));
  static final ThemeData dark = ThemeData();
}
