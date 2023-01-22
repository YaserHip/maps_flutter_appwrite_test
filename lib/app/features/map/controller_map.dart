import 'dart:async';
import 'package:appwrite/models.dart' as models;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/repository_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_location.dart';

import '../../aw_paths.dart';

class ControllerMap extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    throw UnimplementedError();
  }

  Future<bool> getRoutesAndSetMarks(String routeID) async {
    final repo = ref.watch(repositoryMap);
    state = const AsyncLoading().copyWithPrevious(state);
    final list = await repo.getRoutesIDs(routeID);

    final locationsList = list.documents.map((e) {
      return e.convertTo<ModelLocation>((p0) {
        return ModelLocation.fromMap(p0);
      });
    }).toList();

    final listString = locationsList.map((e) {
      return 'databases.${AWPaths().databaseID}.collections.${AWPaths().userInfoCollection}.documents.${e.id}';
    }).toList();

    return true;
  }
}
