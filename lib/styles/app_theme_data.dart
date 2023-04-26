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
        foregroundColor: AppColors.irradiatedGreenColor,
      ),

      // scaffoldBackgroundColor: AppColors.darkblueBlackColor,

      primaryTextTheme: TextTheme(
        displayLarge:
            TextStyle(fontSize: 36, fontWeight: FontWeight.bold, shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 3),
            blurRadius: 5,
          ),
        ]),
      ).apply(
        bodyColor: AppColors.irradiatedGreenColor,
        displayColor: AppColors.irradiatedGreenColor,
      ),
    );
  }

  ThemeData get defaultThemeData => _appTheme!;
}
