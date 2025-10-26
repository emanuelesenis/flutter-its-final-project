import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
    // Avvia la transizione di fade-out
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0; // Riduce l'opacità a 0
      });
    });

    // Naviga alla schermata successiva dopo il fade-out
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(
        context,
      ).go('/tutorial'); // Sostituisci '/tutorial' con la tua route
    });
  }

  @override
  Widget build(BuildContext context) {
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
            duration: const Duration(seconds: 1), // Durata della transizione
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
  }
}
