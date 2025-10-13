import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/firebase/firebase_options.dart';
// import 'package:manga_app/presentation/login.dart';
import 'package:manga_app/presentation/test_api.dart';
import 'package:manga_app/presentation/test_api_cubit.dart';
import 'package:manga_app/providers/providers.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestApiCubit(),
      child: MaterialApp(title: 'Flutter Demo', home: TestApi()),
    );
  }
}
