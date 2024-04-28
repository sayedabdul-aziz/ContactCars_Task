import 'package:contactcars_task/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.darkScaffoldbg,
        foregroundColor: AppColors.primary),
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      background: AppColors.darkScaffoldbg,
      seedColor: AppColors.primary,
      // define it to title text color
      onSurface: AppColors.white,
      error: AppColors.redColor,
      outline: Colors.grey,
    ),
  );
}
