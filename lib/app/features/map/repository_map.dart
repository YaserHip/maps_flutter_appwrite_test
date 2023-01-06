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

  Future<models.DocumentList> getRoutesIDs

  // ignore: todo
  //TODO: get all the routes with a DocumentList and then add the ID to the routes of the realtime subscriber
  RealtimeSubscription getRoutesByID(String routeID) {
    return realtime
        .subscribe(['databases.${AWPaths().databaseID}.collections']);
  }
}
