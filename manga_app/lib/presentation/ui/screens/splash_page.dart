import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/bloc/auth/auth_state.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/tutorial/tutorial_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 1.0; // Opacità iniziale

  @override
  void initState() {
    super.initState();

    ///TODO: cambiare state management
    // Avvia la transizione di fade-out
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0; // Riduce l'opacità a 0
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(CheckAuthStatus());
        }

        print("Stato AuthBloc in SplashPage: ${state.runtimeType}");

        Future.delayed(const Duration(seconds: 4), () {
          if (!mounted) return;

          if (state is AuthSuccess) {
            context.go('/home');
          } else if (state is AuthFailure) {
            context.go('/tutorial');
          }
        });

        return Scaffold(
          body: Stack(
            children: [
              // Sfondo
              Positioned.fill(
                child: Image.asset(
                  'assets/images/splash.png', // Sostituisci con il percorso corretto
                  fit: BoxFit.cover,
                ),
              ),
              // Logo con animazione di fade-out
              AnimatedOpacity(
                duration: const Duration(
                  seconds: 1,
                ), // Durata della transizione
                opacity: _opacity, // Opacità dinamica
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/app_logo.svg',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
