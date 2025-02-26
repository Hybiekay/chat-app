import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();
  final userId = "84308rwjbnuhdshsd";
  final userDetail = "urvjnfjhjru";

  saveUserId(String id) {
    storage.write(key: userId, value: id);
  }

  Future<String?> getUserId() async {
    var id = await storage.read(
      key: userId,
    );
    return id;
  }

  Future<void> deleteUserId() async {
    await storage.delete(
      key: userId,
    );
  }

  Future<String?> getUserDetails() async {
    var data = await storage.read(
      key: userDetail,
    );
    return data;
  }

  Future<void> saveUserDetails(String data) async {
    await storage.write(
      key: userDetail,
      value: data,
    );
  }

  Future<void> deleteUserDetails() async {
    await storage.delete(
      key: userDetail,
    );
  }
}
