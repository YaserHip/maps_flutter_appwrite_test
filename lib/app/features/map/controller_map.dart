import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/features/map/repository_map.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_location.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_markers_response.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_route.dart';

import '../../aw_paths.dart';

class ControllerMap extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    throw UnimplementedError();
  }

  RepositoryMap get repositoryMap => ref.read(repositoryMapProvider);

  Stream<String> getMarketsUpdate(List<String> list) {
    return repositoryMap.getRoutesByID(list).stream.map((event) {
      print('asdasd:${event.payload.toString()}');
      return event.payload.toString();
    });
  }

  Future<ModelMarkersResponse> getRoutesAndSetMarks(String routeID) async {
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

    return ModelMarkersResponse(
        listOfLocations: locationsList, listOfStreamingRoutes: listString);
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
  final controller = ref.watch(controllerMapProvider.notifier);

  //final asd = List<String>.from(json.decode(list));

  return controller.getMarketsUpdate(list);
});
