import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/page_login.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/page_map.dart';
import 'package:maps_flutter_appwrite_test/app/routing/not_found_page.dart';

enum AppRoute {
  login,
  home,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const PageMap(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const PageLogin(),
      )
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
