import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemeData {
  final Brightness brightness;
  final AppColors colors;
  final AppTextStyle style;

  AppThemeData(this.brightness, this.colors, this.style);

  factory AppThemeData.light() => AppThemeData(
    Brightness.light,
    AppColors.light(),
    AppTextStyle(AppColors.light()),
  );

  factory AppThemeData.dark() => AppThemeData(
    Brightness.dark,
    AppColors.dark(),
    AppTextStyle(AppColors.dark()),
  );
}

ThemeData appTheme({bool dark = false}) {
  final AppThemeData theme = dark ? AppThemeData.dark() : AppThemeData.light();
  return ThemeData(
    brightness: theme.brightness,
    primaryColor: theme.colors.primaryColor,
    scaffoldBackgroundColor: theme.colors.backgroundColor,
    extensions: [theme.colors, theme.style],

    // TODO: definire altri temi globali come bottoni, input, ecc.
    // TODO: appBar da aggiornare secondo il figma
    appBarTheme: AppBarTheme(
      backgroundColor: theme.colors.primaryColor, // colore di sfondo
      foregroundColor: theme.colors.textPrimary, // colore del titolo e icone
      elevation: 0, // opzionale: app bar flat
      centerTitle: true, // opzionale: centra il titolo
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: theme.colors.primaryColor,
      foregroundColor: theme.colors.textPrimary,
    ),
  );
}
