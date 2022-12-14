import 'package:bimarestan/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // useMaterial3: true,
      primaryColor: ColorManager.primary,
      fontFamily: FontConstants.fontFamily,
      // textTheme: GoogleFonts.seg,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: false,
        border: UnderlineInputBorder(),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorManager.primary,
        onPrimary: Colors.white,
        secondary: Color(0xFF2699FB),
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black45,
        surface: Color(0xffF9F9F9),
        onSurface: Colors.black45,
      ) // textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),
      );
}

// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF0052DE),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFDBE1FF),
//   onPrimaryContainer: Color(0xFF00174C),
//   secondary: Color(0xFF2D5CAC),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFD8E2FF),
//   onSecondaryContainer: Color(0xFF001A42),
//   tertiary: Color(0xFF7E32D0),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFEEDBFF),
//   onTertiaryContainer: Color(0xFF2A0053),
//   error: Color(0xFFBA1A1A),
//   errorContainer: Color(0xFFFFDAD6),
//   onError: Color(0xFFFFFFFF),
//   onErrorContainer: Color(0xFF410002),
//   background: Color(0xFFFFFBFF),
//   onBackground: Color(0xFF1B0261),
//   surface: Color(0xFFFFFBFF),
//   onSurface: Color(0xFF1B0261),
//   surfaceVariant: Color(0xFFE2E1EC),
//   onSurfaceVariant: Color(0xFF45464F),
//   outline: Color(0xFF757680),
//   onInverseSurface: Color(0xFFF4EEFF),
//   inverseSurface: Color(0xFF302175),
//   inversePrimary: Color(0xFFB4C4FF),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF0052DE),
//   // outlineVariant: Color(0xFFC6C6D0),
//   // scrim: Color(0xFF000000),
// );

