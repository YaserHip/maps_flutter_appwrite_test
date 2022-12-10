import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:maps_flutter_appwrite_test/app/app_providers.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/repository_auth.dart';

class ControllerLogin extends StateNotifier<AsyncValue<void>> {
  ControllerLogin({
    required this.repositoryAuth,
    required this.location,
  }) : super(const AsyncData(null));
  final RepositoryAuth repositoryAuth;
  final Location location;

  Future<bool> oAuth2Session(String provider) async {
    try {
      state = const AsyncLoading();
      final value = await repositoryAuth.oAuth2Session(provider);
      state = AsyncData(value);
    } on Exception catch (e, trace) {
      state = AsyncError(e, trace);
    }

    if (!state.hasError) {
      try {
        final value = await repositoryAuth.checkIfUserExist();
        print("CHECKIFEXIST: ${value.toMap()}");
      } on Exception catch (e) {
        print("CHECKIFEXIST-error: ${e.toString()}");
        await repositoryAuth.createUserDocument();
      }
    }

    return state.hasError == false;
  }

  Future<bool> magicURLSession(String email) async {
    try {
      state = const AsyncLoading();
      final value = await repositoryAuth.magicURLSession(email);
      state = AsyncData(value);
    } on Exception catch (e, trace) {
      state = AsyncError(e, trace);
    }
    return state.hasError == false;
  }

  Future<bool> magicURLSessionConfirmation(String secret) async {
    try {
      state = const AsyncLoading();
      final value = await repositoryAuth.magicURLSessionConfirmation(secret);
      state = AsyncData(value);
    } on Exception catch (e, trace) {
      state = AsyncError(e, trace);
    }
    return state.hasError == false;
  }

  Future<void> askForLocationPermission() async {
    await location.requestService();
    await location.requestPermission();
  }

  Future<bool> checkLocationPermissions() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return false;
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) return false;
    }

    return true;
  }
}

final loginControllerProvider =
    StateNotifierProvider<ControllerLogin, AsyncValue<void>>((ref) {
  return ControllerLogin(
      repositoryAuth: ref.watch(repositoryAuthProvider),
      location: ref.watch(locationServiceProvider));
});
