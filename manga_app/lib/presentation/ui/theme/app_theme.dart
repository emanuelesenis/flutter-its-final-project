import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFFF5F5);

const kPrimaryColor = Color(0xFF905D5D);

const kSecondaryColor = Color(0xFF272525);

final appTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kPrimaryColor),
  appBarTheme: const AppBarTheme(foregroundColor: kBackgroundColor),
  scaffoldBackgroundColor: kBackgroundColor,
  textTheme: const TextTheme(titleLarge: TextStyle(color: kSecondaryColor, fontSize: 24, fontWeight: FontWeight.bold), ),
);
