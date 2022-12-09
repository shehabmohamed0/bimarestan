import 'package:flutter/material.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2C5AB6),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFD9E2FF),
      onPrimaryContainer: Color(0xFF001946),
      secondary: Color(0xFF585E71),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFDCE2F9),
      onSecondaryContainer: Color(0xFF151B2C),
      tertiary: Color(0xFF0056D0),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFDAE2FF),
      onTertiaryContainer: Color(0xFF001847),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFEFBFF),
      onBackground: Color(0xFF1B1B1F),
      surface: Color(0xFFFEFBFF),
      onSurface: Color(0xFF1B1B1F),
      surfaceVariant: Color(0xFFE1E2EC),
      onSurfaceVariant: Color(0xFF44464F),
      outline: Color(0xFF757780),
      onInverseSurface: Color(0xFFF2F0F4),
      inverseSurface: Color(0xFF303034),
      inversePrimary: Color(0xFFB1C5FF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF2C5AB6),
    ),
  );
}
