import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
}
