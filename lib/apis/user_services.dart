import 'dart:developer';
import 'package:appwrite/appwrite.dart';
import 'package:dating_app/model/user_model.dart';

class UserServices {
  final String databaseId;
  final String userCollectionId;
  Databases databases;
  UserServices({
    required this.databaseId,
    required this.userCollectionId,
    required this.databases,
  });

  Future<(bool, List<UserModel>?)> getAllUser() async {
    try {
      var docs = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: userCollectionId,
      );
      List<UserModel> allUser =
          docs.documents.map((user) => UserModel.fromMap(user.data)).toList();
      return (true, allUser);
    } on AppwriteException catch (e) {
      log("${e.message}");
      return (false, null);
    } catch (e) {
      log(e.toString());
      return (false, null);
    }
  }
}
