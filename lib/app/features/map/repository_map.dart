import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

class RepositoryMap {
  RepositoryMap(
      {required this.userID, required this.realtime, required this.databases});

  String userID;
  Realtime realtime;
  Databases databases;

  Future<models.Document> 
}
