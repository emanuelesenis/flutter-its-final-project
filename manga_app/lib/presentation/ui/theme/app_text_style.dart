import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  final AppColors colors;

  final TextStyle h1; // Aboreto 30
  final TextStyle h2; // Aboreto 24
  final TextStyle h3; // Monserrat 20
  final TextStyle h4; // Monserrat 16
  final TextStyle body; // Monserrat 16

  AppTextStyle(this.colors)
    : h1 = TextStyle(
        fontSize: 30,
        fontFamily: 'Aboreto',
        color: colors.textPrimary,
      ),
      h2 = TextStyle(
        fontSize: 24,
        fontFamily: 'Aboreto',
        color: colors.textPrimary,
      ),
      h3 = TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        color: colors.textPrimary,
      ),
      h4 = TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: colors.textPrimary,
      ),
      body = TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: colors.textSecondary,
      );

  @override
  ThemeExtension<AppTextStyle> copyWith() {
    return AppTextStyle(colors);
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
    ThemeExtension<AppTextStyle>? other,
    double t,
  ) {
    if (other is! AppTextStyle) return this;
    return AppTextStyle(colors);
  }
}
