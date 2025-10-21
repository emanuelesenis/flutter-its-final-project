import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/firebase/firebase_options.dart';
import 'package:manga_app/presentation/router/app_router.dart';
// import 'package:manga_app/presentation/login.dart';
import 'package:manga_app/presentation/test_api_cubit.dart';
import 'package:manga_app/presentation/ui/theme/app_theme.dart';
import 'package:manga_app/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuthService().signOut();
  setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TestApiCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp.router(
        title: 'Manga App',
        routerConfig: appRouter,
        theme: appTheme(dark: false), // Tema light
        darkTheme: appTheme(dark: true), // Tema dark
        themeMode: ThemeMode.system, // Segue le impostazioni del sistema
        // home: BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, state) {
        //     if (state is AuthInitial) {
        //       context.read<AuthBloc>().add(CheckAuthStatus());
        //     }
        //
        //     if (state is AuthSuccess) {
        //       return HomePage();
        //     } else if (state is AuthFailure) {
        //       return LoginPage();
        //     } else {
        //       return RegisterPage();
        //     }
        //   },
        // ),
      ),
    ),
  );
}

// The actual app widget is defined in `my_app.dart` and uses GoRouter.
