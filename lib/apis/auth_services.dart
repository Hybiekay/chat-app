import 'package:appwrite/appwrite.dart';
import 'package:dating_app/core/helper/hive_databases.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/model/user_model.dart';

class AuthService {
  final Account account;
  final Databases databases;
  final String dbId;
  final String userCollectionId;
  const AuthService(
      {required this.account,
      required this.databases,
      required this.dbId,
      required this.userCollectionId});

  Future<(bool, String)> register(
      {required UserModel userModel, required String password}) async {
    try {
      final user = await account.create(
          userId: userModel.id,
          email: userModel.email,
          password: password,
          name: userModel.name);

      await databases.createDocument(
          databaseId: dbId,
          collectionId: userCollectionId,
          documentId: user.$id,
          data: userModel.toMap());
      return (true, "Register Successfully");
    } on AppwriteException catch (error) {
      return (false, error.message ?? "Unknown Error Occurred");
    }
  }

  Future<(bool, String)> login(
      {required String email, required String password}) async {
    try {
      var session = await account.createEmailPasswordSession(
          email: email, password: password);
      SecureStorage().saveUserId(session.userId);

      return (true, "Login Successfully");
    } on AppwriteException catch (error) {
      return (false, (error.message ?? "UnKnown Erorr Occurred"));
    }
  }
}
