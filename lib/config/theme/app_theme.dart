import 'package:evently_c13_offline/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManager.primary,
        secondary: ColorsManager.black,
        onSecondary: ColorsManager.white,
        onPrimary: ColorsManager.ofWhite,
        onSurface: ColorsManager.primary,
      ),
      primaryColor: ColorsManager.primary,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorsManager.primary),
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
        ),
        scrolledUnderElevation: 0,
        color: ColorsManager.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
            color: ColorsManager.primary,
            fontWeight: FontWeight.w400,
            fontSize: 18),
      ),
      scaffoldBackgroundColor: ColorsManager.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.white,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(), color: ColorsManager.primary),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primary,
        shape: StadiumBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
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
            fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: ColorsManager.primary,
            fontWeight: FontWeight.w500),
        labelSmall: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black),
        labelMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.primary),
        labelLarge: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorsManager.white),
        titleSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsManager.white),
        headlineMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black),
      ));

  static final ThemeData dark = ThemeData(
      primaryColor: ColorsManager.darkPrimary,
      colorScheme: ColorScheme.fromSeed(
        onPrimary: ColorsManager.primary,
        onSurface: ColorsManager.white,
        seedColor: ColorsManager.darkPrimary,
        secondary: ColorsManager.white,
        onSecondary: ColorsManager.darkPrimary,
      ),
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: ColorsManager.darkPrimary),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
        ),
        scrolledUnderElevation: 0,
        color: ColorsManager.darkPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
            color: ColorsManager.primary,
            fontWeight: FontWeight.w400,
            fontSize: 18),
      ),
      scaffoldBackgroundColor: ColorsManager.darkPrimary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.ofWhite,
        unselectedItemColor: ColorsManager.ofWhite,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
          shape: CircularNotchedRectangle(), color: ColorsManager.darkPrimary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: ColorsManager.ofWhite,
        backgroundColor: ColorsManager.darkPrimary,
        shape: StadiumBorder(
            side: BorderSide(width: 4, color: ColorsManager.ofWhite)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.inter(
            color: ColorsManager.ofWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsManager.primary, width: 1),
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
            color: ColorsManager.white,
            fontWeight: FontWeight.w500),
        bodyMedium: GoogleFonts.inter(
            fontSize: 20,
            color: ColorsManager.primary,
            fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: ColorsManager.primary,
            fontWeight: FontWeight.w500),
        labelSmall: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black),
        labelMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.primary),
        labelLarge: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorsManager.white),
        titleSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsManager.white),
        headlineMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black),
      ));
}
