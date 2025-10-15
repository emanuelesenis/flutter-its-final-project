import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color textPrimary;
  final Color textSecondary;

  AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.textPrimary,
    required this.textSecondary,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textPrimary,
    Color? textSecondary,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }

  // Light theme colors
  factory AppColors.light() => AppColors(
    primaryColor: Color(0xFF905D5D),
    secondaryColor: Color(0x99905D5D),
    backgroundColor: Color(0xFFFFF5F5),
    textPrimary: Colors.black,
    textSecondary: Colors.black,
  );

  // Dark theme colors
  factory AppColors.dark() => AppColors(
    primaryColor: Color(0xFFA87B7B),
    secondaryColor: Color(0x99A87B7B),
    backgroundColor: Color(0xFF000000),
    textPrimary: Colors.white,
    textSecondary: Colors.white,
  );
}
