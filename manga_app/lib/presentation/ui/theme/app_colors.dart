import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
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
    );
  }

  // Light theme colors
  factory AppColors.light() => AppColors(
        primaryColor: Colors.blue,
        secondaryColor: Colors.green,
        backgroundColor: Colors.white,
      );

  // Dark theme colors
  factory AppColors.dark() => AppColors(
        primaryColor: Colors.blue.shade200,
        secondaryColor: Colors.green.shade200,
        backgroundColor: Colors.black,
      );
}