import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:maps_flutter_appwrite_test/app/aw_paths.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/repository_auth.dart';
import 'package:maps_flutter_appwrite_test/app/features/models/model_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app_providers.dart';
import '../models/model_location.dart';
import '../models/model_markers_response.dart';

part 'repository_map.g.dart';

class RepositoryMap {
  RepositoryMap(
      {required this.userID, required this.realtime, required this.databases});

  String userID;
  Realtime realtime;
  Databases databases;

  RealtimeSubscription? _subscription = null;

  Future<models.DocumentList> getRouteNames() async {
    return await databases.listDocuments(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().routeNamesCollection);
  }

  Future<models.DocumentList> getRoutesList() async {
    return await databases.listDocuments(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().routeNamesCollection);
  }

  Future<models.DocumentList> getRoutesIDs(String routesID) async {
    return await databases.listDocuments(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().userInfoCollection,
        queries: [Query.equal('routeid', routesID)]);
  }

  cancelSubRealtime() async {
    if (_subscription != null) {
      await _subscription?.close.call();
    }
  }

  RealtimeSubscription? getRoutesByID(List<String> routeList) {
    _subscription = realtime.subscribe(routeList);
    return _subscription;
  }
}

@riverpod
RepositoryMap repositoryMap(RepositoryMapRef ref) => RepositoryMap(
    userID: ref.read(repositoryAuthProvider).userID,
    realtime: ref.watch(AWRealTimeProvider),
    databases: ref.watch(AWDatabaseProvider));

@riverpod
Future<List<ModelRoute>> getRoutesList(GetRoutesListRef ref) async {
  final repo = ref.watch(repositoryMapProvider);
  final listOfRoutes = await repo.getRoutesList();
  final list = listOfRoutes.documents.map(
    (e) {
      return e.convertTo((p0) => ModelRoute.fromMap(p0));
    },
  ).toList();

  list.add(const ModelRoute(id: "0", name: "name"));

  return list;
}

@riverpod
Future<ModelMarkersResponse> getListOfMarkersPos(
    GetListOfMarkersPosRef ref, String routeID) async {
  final repo = await ref.watch(repositoryMapProvider).getRoutesIDs(routeID);

  final locationsList = repo.documents.map((e) {
    return e.convertTo<ModelLocation>((p0) {
      return ModelLocation.fromMap(p0);
    });
  }).toList();

  final listString = locationsList.map((e) {
    return 'databases.${AWPaths().databaseID}.collections.${AWPaths().userInfoCollection}.documents.${e.id}';
  }).toList();

  return ModelMarkersResponse(
      listOfLocations: locationsList, listOfStreamingRoutes: listString);
}

@riverpod
Stream<ModelLocation> streamMarkersPos(StreamMarkersPosRef ref,
    {required List<String> list}) {
  final repo = ref.watch(repositoryMapProvider);

  final stream = repo.getRoutesByID(list)?.stream.map((event) {
    print('asdasd:${event.payload.toString()}');
    return ModelLocation.fromMap(event.payload);
  });

  return stream!;
}
