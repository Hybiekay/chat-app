import 'package:dating_app/core/helper/secure_storage.dart';

Future<bool> isCurrentUserId(String id) async {
  String? userId = await SecureStorage().getUserId();
  if (userId == id) return true;
  return false;
}
