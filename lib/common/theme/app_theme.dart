import 'package:flutter/material.dart';
import 'package:workout_app/common/constants/app_colors.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      background: AppColors.backgroundColor,
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 18,
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.contrastColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
