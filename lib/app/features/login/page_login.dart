import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/controller_login.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/repository_auth.dart';
import 'package:maps_flutter_appwrite_test/app/routing/app_route.dart';

class PageLogin extends ConsumerStatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageLoginState();
}

class _PageLoginState extends ConsumerState<PageLogin> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_getLocationPermission();
  }

  _getLocationPermission() async {
    await ref.read(loginControllerProvider.notifier).askForLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    final nav = GoRouter.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Login with phone")),
        body: Center(
          child: state.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      child: const Text("Google"),
                      onPressed: () async {
                        /*  final isLocationGranted = await ref
                            .read(loginControllerProvider.notifier)
                            .checkLocationPermissions(); */

                        /* if (isLocationGranted) {
                          final success = await ref
                              .read(loginControllerProvider.notifier)
                              .oAuth2Session("google");
                          if (success) {
                            nav.goNamed(AppRoute.home.name);
                          }
                        } */
                        final success = await ref
                            .read(repositoryAuthProvider)
                            .oAuth2Session('google');
                        print('success: $success');
                        if (success) {
                          print('success: 1');
                          nav.goNamed(AppRoute.home.name);
                        }
                      },
                    ),
                  ],
                ),
        ));
  }
}
