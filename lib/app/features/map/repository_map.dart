import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/aw_paths.dart';
import 'package:maps_flutter_appwrite_test/app/features/login/repository_auth.dart';

import '../../app_providers.dart';

class RepositoryMap {
  RepositoryMap(
      {required this.userID, required this.realtime, required this.databases});

  String userID;
  Realtime realtime;
  Databases databases;

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

  RealtimeSubscription getRoutesByID(List<String> routeList) {
    return realtime.subscribe(routeList);
  }
}

final repositoryMapProvider = Provider<RepositoryMap>(((ref) => RepositoryMap(
    userID: ref.read(repositoryAuthProvider).userID,
    realtime: ref.watch(AWRealTimeProvider),
    databases: ref.watch(AWDatabaseProvider))));
