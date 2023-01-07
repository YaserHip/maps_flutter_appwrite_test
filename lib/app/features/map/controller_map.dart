import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/repository_map.dart';

class ControllerMap extends StateNotifier<AsyncValue<void>> {
  ControllerMap({required this.repositoryMap}) : super(const AsyncData(null));
  final RepositoryMap repositoryMap;


  Stream<
}
