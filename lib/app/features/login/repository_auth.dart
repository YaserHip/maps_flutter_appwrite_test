import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maps_flutter_appwrite_test/app/app_providers.dart';
import 'package:maps_flutter_appwrite_test/app/aw_paths.dart';

class RepositoryAuth {
  RepositoryAuth({required this.account, required this.databases});
  final Account account;
  String userID = "";
  Databases databases;

  Future<void> oAuth2Session(String provider) async {
    final value = await account.createOAuth2Session(provider: provider);
    var user = await account.get();

    userID = user.$id;
    return value;
  }

  Future<models.Token> magicURLSession(String email) async {
    var value =
        await account.createMagicURLSession(userId: 'unique()', email: email);
    userID = value.userId;
    return value;
  }

  Future<models.Session> magicURLSessionConfirmation(String secret) async {
    return await account.updateMagicURLSession(userId: userID, secret: secret);
  }

  Future<models.Document> checkIfUserExist() async {
    return await databases.getDocument(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().userInfoCollection,
        documentId: userID);
  }

  Future<models.Document> createUserDocument() async {
    return await databases.createDocument(
        databaseId: AWPaths().databaseID,
        collectionId: AWPaths().userInfoCollection,
        documentId: userID,
        data: {'lat': '0', 'lon': '0'});
  }
}

final repositoryAuthProvider = Provider<RepositoryAuth>((ref) => RepositoryAuth(
    account: ref.watch(AWAccountProvider),
    databases: ref.watch(AWDatabaseProvider)));
