import 'dart:async';
import 'dart:math';
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

  Future<List<String>> getRoutesAndSetMarks(String routeID) async {
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

    state = AsyncData(listString);

    return listString;
  }
}

final getRoutesListProvider =
    AutoDisposeFutureProvider<List<ModelRoute>>((ref) async {
  final repository = ref.watch(repositoryMapProvider);
  final listOfRoutes = await repository.getRoutesList();
  final list = listOfRoutes.documents.map(
    (e) {
      return e.convertTo((p0) => ModelRoute.fromMap(p0));
    },
  ).toList();

  list.add(const ModelRoute(id: "0", name: "name"));

  return list;
});

final controllerMapProvider =
    AutoDisposeAsyncNotifierProvider<ControllerMap, void>(ControllerMap.new);

final markersStreamProvider =
    StreamProvider.autoDispose.family<String, List<String>>((ref, list) {
  final repoMap = ref.watch(repositoryMapProvider);
  return repoMap.getRoutesByID(list).stream.map((event) {
    if (event.events.contains("databases.*.collections.*.documents.*.update")) {
      print('MARKERS RESULT: ${event.payload}');
      return event.payload.toString();
    } else {
      return '';
    }
  });
});
