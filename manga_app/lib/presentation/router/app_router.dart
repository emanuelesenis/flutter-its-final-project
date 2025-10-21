import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/screens/details_page.dart';
import 'package:manga_app/presentation/ui/screens/profile_page.dart';
import 'package:manga_app/presentation/ui/screens/search_page.dart';
import 'package:manga_app/presentation/ui/screens/search_results_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
/// Router configuration for the app
final GoRouter appRouter = GoRouter(
  routerNeglect: true,
  initialLocation: '/',
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/',
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
    GoRoute(
      path: '/search_results/:searched_title',
      name: 'search_results',
      builder: (context, state) {
        final String? searchedTitle = state.pathParameters['searched_title'];
        return SearchResultsPage(searchedTitle: searchedTitle ?? '');
      },
    ),
    GoRoute(
      path: '/profile/:user_id',
      name: 'profile',
      builder: (context, state) {
        final userId = state.pathParameters['user_id'];
        return ProfilePage(userId: userId ?? '');
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
