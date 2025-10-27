import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/screens/favorites_page.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/bloc/auth/auth_state.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/login/login_screen.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/registration/registration_screen.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/tutorial/tutorial_screen.dart';
import 'package:manga_app/presentation/ui/screens/profile_page.dart';
import 'package:manga_app/presentation/ui/screens/search_page.dart';
import 'package:manga_app/presentation/ui/screens/splash_page.dart';
import 'package:manga_app/presentation/ui/screens/details_page/details_page.dart';
import 'package:manga_app/presentation/ui/screens/search_results_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Router configuration for the app
String initialLocation = '/';


final GoRouter appRouter = GoRouter(
  routerNeglect: true,
  initialLocation: initialLocation,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/home');
          } else if (state is AuthFailure) {
            context.go('/tutorial');
          }
        },
        child: SplashPage(),
      ),
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
      path: '/login',
      name: 'login',
      builder: (context, state) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            context.read<AuthBloc>().add(CheckAuthStatus());
          }

          if (state is AuthSuccess) {
            context.go('/home');
          }
        },
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/registration',
      name: 'registration',
      builder: (context, state) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            context.read<AuthBloc>().add(CheckAuthStatus());
          }

          if (state is AuthSuccess) {
            context.go('/home');
          }
        },
        child: RegistrationScreen(),
      ),
    ),
    GoRoute(
      path: '/details/:id',
      name: 'details',
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
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (context, state) {
        return FavoritesPage();
      },
    ),
    GoRoute(
      path: '/search_results/:searched_title',
      name: 'search_results',
      builder: (context, state) {
        final String? searchedTitle = state.pathParameters['searched_title'];
        return SearchResultsPage(searchedTitle: searchedTitle ?? '');
      },
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) {
        return ProfilePage();
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
            'Page not found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    ),
  ),
);
