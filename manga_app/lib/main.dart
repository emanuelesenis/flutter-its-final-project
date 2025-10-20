import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/firebase/firebase_options.dart';
import 'package:manga_app/my_app.dart';
import 'package:manga_app/presentation/test_api_cubit.dart';
import 'package:manga_app/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuthService().signOut();
  setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TestApiCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

// The actual app widget is defined in `my_app.dart` and uses GoRouter.
