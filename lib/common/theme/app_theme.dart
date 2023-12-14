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
  );
}
