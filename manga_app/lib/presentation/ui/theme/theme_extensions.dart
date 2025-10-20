import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

extension ThemeContextExtension on BuildContext {
  /// Accesso rapido ai colori del tema
  AppColors get colors => AppThemeData.colorsOf(this);

  /// Accesso rapido agli stili di testo del tema
  AppTextStyle get textStyles => AppThemeData.textStyleOf(this);

  /// Verifica se è attivo il tema scuro
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Verifica se è attivo il tema chiaro
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Accesso rapido al MediaQuery
  Size get screenSize => MediaQuery.of(this).size;

  /// Accesso rapido alla larghezza dello schermo
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Accesso rapido all'altezza dello schermo
  double get screenHeight => MediaQuery.of(this).size.height;
}
