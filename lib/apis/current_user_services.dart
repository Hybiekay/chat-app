import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/model/user_model.dart';

class CurrentUserServices {
  final String databaseId;
  final String collectionId;
  Databases databases;
  Storage storage;
  CurrentUserServices({
    required this.collectionId,
    required this.databaseId,
    required this.databases,
    required this.storage,
  });

  Future<(bool, UserModel?)> getUserDetails() async {
    try {
      String? userId = await SecureStorage().getUserId();
      var docs = await databases.getDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: userId!);

      UserModel userModel = UserModel.fromMap(docs.data);
      SecureStorage().saveUserDetails(jsonEncode(docs.data));
      return (true, userModel);
    } on AppwriteException catch (e) {
      log("${e.message}");
      return (false, null);
    } catch (e) {
      log(e.toString());
      return (false, null);
    }
  }

  Future<(bool, String)> uploadUserProfilePic(File file) async {
    try {
      final userImage = await storage.createFile(
          bucketId: AppwriteConstant.userBucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(path: file.path));

      final url = AppwriteConstant.getFileUrl(
          AppwriteConstant.userBucketId, userImage.$id);

      return (true, url);
    } on AppwriteException catch (error) {
      return (false, "${error.message}");
    }
  }

  Future<(bool, UserModel?)> updateUserDetails(UserModel userModel) async {
    try {
      var docs = await databases.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: userModel.id,
        data: userModel.toMap(),
      );

      UserModel user = UserModel.fromMap(docs.data);
      return (true, user);
    } on AppwriteException catch (error) {
      return (false, null);
    }
  }

  void deleteProfilePic({required String id}) async {
    try {
      await storage.deleteFile(
        bucketId: AppwriteConstant.userBucketId,
        fileId: id,
      );
    } on AppwriteException catch (error) {
      log("${error.message}");
    }
  }
}
