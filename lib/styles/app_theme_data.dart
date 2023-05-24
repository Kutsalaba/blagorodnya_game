import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemeData {
  static AppThemeData? _instance;
  ThemeData? _appTheme;

  factory AppThemeData() {
    return _instance ??= AppThemeData._();
  }

  AppThemeData._() {
    _appTheme = ThemeData(
      fontFamily: GoogleFonts.comicNeue().fontFamily,
      appBarTheme: const AppBarTheme(
        // foregroundColor: AppColors.irradiatedGreenColor,
      ),

      // scaffoldBackgroundColor: AppColors.darkblueBlackColor,

      primaryTextTheme: TextTheme(
        displaySmall: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 5,
            ),
          ],
          color: AppColors.irradiatedGreenColor,
        ),
      ),
    );
  }

  ThemeData get defaultThemeData => _appTheme!;
}
