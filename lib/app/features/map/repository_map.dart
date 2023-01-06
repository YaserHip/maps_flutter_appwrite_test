import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:maps_flutter_appwrite_test/app/aw_paths.dart';

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

  Future<models.DocumentList> getRoutesIDs(String routesID) async {
    return await databases.listDocuments(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().userInfoCollection,
        queries: [Query.equal('ruteID', routesID)]);
  }

  RealtimeSubscription getRoutesByID(List<String> routeList) {
    return realtime.subscribe(routeList);
  }
}
