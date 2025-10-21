import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/screens/details_page.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/login/login_screen.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/registration/registration_screen.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/tutorial/tutorial_screen.dart';
import 'package:manga_app/presentation/ui/screens/search_page.dart';
import 'package:manga_app/presentation/ui/screens/splash_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
/// Router configuration for the app
final GoRouter appRouter = GoRouter(
  routerNeglect: true,
  initialLocation: '/',
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/tutorial',
      name: 'tutorial',
      builder: (context, state) => const TutorialScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final mangaId = state.uri.queryParameters['id'];
        return DetailsPage(mangaId: mangaId);
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/registration',
      name: 'registration',
      builder: (context, state) {
        return RegistrationScreen();
      },
    ),
    GoRoute(
      path: '/details/:id',
      name: 'details_with_id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return DetailsPage(mangaId: id);
      },
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) {
        return SearchPage();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64),
          const SizedBox(height: 16),
          Text(
            'Pagina non trovata',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Torna alla Home'),
          ),
        ],
      ),
    ),
  ),
);
