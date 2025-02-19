import 'package:hive_ce/hive.dart';

class HiveDatabases {
  final user = Hive.box('user');
  saveUserId(String id) async {
    final user = await Hive.openBox('user');

    await user.put("userId", id);
  }

  String? getUserId() {
    String? userId = user.get("userId");

    return userId;
  }
}
