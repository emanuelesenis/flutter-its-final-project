import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemeData {
  final Brightness brightness;
  final AppColors colors;
  final AppTextStyle style;

  AppThemeData(this.brightness, this.colors, this.style);

  factory AppThemeData.light() =>
      AppThemeData(Brightness.light, AppColors.light(), AppTextStyle(AppColors.light()));

  factory AppThemeData.dark() =>
      AppThemeData(Brightness.dark, AppColors.dark(), AppTextStyle(AppColors.dark()));
}

ThemeData appTheme({bool dark = false}) {
  final AppThemeData theme = dark ? AppThemeData.dark() : AppThemeData.light();
  return ThemeData(
    brightness: theme.brightness,
    extensions: [theme.colors, theme.style],
    primaryColor: theme.colors.primaryColor,
  );
}
