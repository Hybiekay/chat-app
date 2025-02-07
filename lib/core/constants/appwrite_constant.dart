import 'package:appwrite/appwrite.dart';

class AppwriteConstant {
  static const String projectId = "67a353e00014b28e4142";
  static const String databaseId = "67a3578000087dbcb752";
  static const String usersCollectionId = "67a357e00005f16cb706";

  static Client client = Client().setProject(projectId);

  final Account _account = Account(client);
  final Databases _databases = Databases(client);
  final Storage _storage = Storage(client);

  Account get appWriteAccount => _account;
  Databases get appWriteDatabases => _databases;
  Storage get appWriteStorage => _storage;
}
