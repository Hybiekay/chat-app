import 'package:dating_app/apis/user_services.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserServices _userServices = UserServices(
      databaseId: AppwriteConstant.databaseId,
      userCollectionId: AppwriteConstant.usersCollectionId,
      databases: AppwriteConstant().appWriteDatabases);
  List<UserModel> _allUser = [];
  List<UserModel> get allUser => _allUser;

  Future getAllUser() async {
    final (isSucces, users) = await _userServices.getAllUser();
    if (isSucces) {
      _allUser.addAll(users!);
      notifyListeners();
    }
  }
}
