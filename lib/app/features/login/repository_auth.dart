import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:maps_flutter_appwrite_test/app/app_providers.dart';
import 'package:maps_flutter_appwrite_test/app/aw_paths.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_auth.g.dart';

class RepositoryAuth {
  RepositoryAuth({required this.account, required this.databases});
  final Account account;
  String userID = "";
  Databases databases;

  Future<bool> oAuth2Session(String provider) async {
    try {
      await account.createOAuth2Session(provider: provider);

      var user = await account.get();
      userID = user.$id;

      try {
        await checkIfUserExist();
      } on Exception catch (e, _) {
        await createUserDocument();
      }

      return true;
    } on Exception catch (e, _) {
      return false;
    }
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

@riverpod
RepositoryAuth repositoryAuth(RepositoryAuthRef ref) => RepositoryAuth(
    account: ref.watch(AWAccountProvider),
    databases: ref.watch(AWDatabaseProvider));

@riverpod
Future<bool> oAuth2Session(OAuth2SessionRef ref, {required String provider}) {
  final repoLogin = ref.watch(repositoryAuthProvider).oAuth2Session(provider);
  return repoLogin;
}
