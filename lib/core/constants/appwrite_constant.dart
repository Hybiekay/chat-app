import 'dart:developer';
import 'package:appwrite/appwrite.dart';

class AppwriteConstant {
  static const String appwriteEndpoint = "https://cloud.appwrite.io/v1";
  static const String projectId = "67a353e00014b28e4142";
  static const String databaseId = "67a3578000087dbcb752";
  static const String userBucketId = "67b86e15002e73aaf799";
  static const String usersCollectionId = "67a357e00005f16cb706";

  static Client client = Client().setProject(projectId);

  final Account _account = Account(client);
  final Databases _databases = Databases(client);
  final Storage _storage = Storage(client);

  Account get appWriteAccount => _account;
  Databases get appWriteDatabases => _databases;
  Storage get appWriteStorage => _storage;

  static String getFileUrl(String bucketId, String fileId) {
    return '$appwriteEndpoint/storage/buckets/$bucketId/files/$fileId/view?project=$projectId';
  }

  static String? getFileIdFromUrl(String url) {
    try {
      final uri = Uri.parse(url);

      // Check if the URL is valid and structured correctly
      if (uri.pathSegments.length >= 5 &&
          uri.pathSegments[2] == 'buckets' &&
          uri.pathSegments[4] == 'files') {
        // The fileId should be in the fifth segment of the path
        return uri.pathSegments[5];
      }
      log("Invalid Url and Cant be Delected");
      return null; // Return null if the structure doesn't match
    } catch (e) {
      log("Invalid URL format: $e");
      return null;
    }
  }
}
