import 'package:flutter/material.dart';

import 'package:manga_app/presentation/ui/theme/app_theme.dart';
import 'package:manga_app/presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manga App',
      theme: appTheme(dark: false),
      darkTheme: appTheme(dark: true),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
