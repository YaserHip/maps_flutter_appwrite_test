import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_flutter_appwrite_test/app/app_providers.dart';
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
    redirect: (context, state) async {
      final account = ref.watch(AWAccountProvider);
      var isLogged = false;

      try {
        await account.get();
        isLogged = true;
      } on Exception catch (e, _) {
        print('$e');
      }

      if (isLogged) {
        if (state.subloc.startsWith('/login')) {
          return '/';
        }
      } else {
        if (state.subloc.startsWith('/')) {
          return '/login';
        }
      }

      return null;
    },
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
