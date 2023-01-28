import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/repository_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_location.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_route.dart';

import '../../aw_paths.dart';

class ControllerMap extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    throw UnimplementedError();
  }

  RepositoryMap get repositoryMap => ref.read(repositoryMapProvider);

  //TODO:transfor all the request to streams realtime and all the deletes and updates on controller…

  Future<List<ModelRoute>> getRoutesList() async {
    state = const AsyncLoading().copyWithPrevious(state);
    final listOfRoutes = await repositoryMap.getRoutesList();
    state = AsyncData(listOfRoutes);

    return listOfRoutes.documents.map(
      (e) {
        return e.convertTo((p0) => ModelRoute.fromMap(p0));
      },
    ).toList();
  }

  Future<bool> getRoutesAndSetMarks(String routeID) async {
    state = const AsyncLoading().copyWithPrevious(state);
    final list = await repositoryMap.getRoutesIDs(routeID);

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
