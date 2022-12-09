import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.onPrimary,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.onSecondary,
      error: ColorManager.error,
      onError: ColorManager.onError,
      background: ColorManager.background,
      onBackground: ColorManager.onBackground,
      surface: ColorManager.surface,
      onSurface: ColorManager.onSurface,
      tertiary: ColorManager.tertiary,
      onTertiary: ColorManager.onTertiary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // isDense: true,
      filled: true,
      fillColor: Colors.white,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.onPrimary,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ColorManager.onPrimary,
        fontWeight: FontWeightManager.regular,
      ),
      actionsIconTheme: IconThemeData(color: Colors.white),
      
      iconTheme: IconThemeData(
        color: ColorManager.onSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.secondary,
        foregroundColor: ColorManager.onSecondary,
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorManager.onSecondary,
        backgroundColor: ColorManager.secondary,
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
  );
}
