import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/bloc/auth/auth_state.dart';
// import 'package:manga_app/firebase/firebase_auth_service.dart';
import 'package:manga_app/firebase/firebase_options.dart';
import 'package:manga_app/presentation/altra_pagina.dart';
import 'package:manga_app/presentation/login.dart';
import 'package:manga_app/presentation/signup.dart';
// import 'package:manga_app/presentation/login.dart';
import 'package:manga_app/presentation/test_api_cubit.dart';
import 'package:manga_app/providers/providers.dart';
import 'package:manga_app/presentation/ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuthService().signOut();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TestApiCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(dark: false), // Tema light
        darkTheme: appTheme(dark: true), // Tema dark
        themeMode: ThemeMode.system, // Segue le impostazioni del sistema
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              context.read<AuthBloc>().add(CheckAuthStatus());
            }

            if (state is AuthSuccess) {
              return AltraPagina();
            } else if (state is AuthFailure) {
              return LoginPage();
            } else {
              return RegisterPage();
            }
          },
        ),
      ),
    );
  }
}
