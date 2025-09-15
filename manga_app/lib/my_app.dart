import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga App',
      theme: appTheme,
      home: const HomePage(title: 'Manga App'),
    );
  }
}
