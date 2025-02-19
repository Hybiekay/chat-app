import 'dart:convert';

import 'package:dating_app/apis/current_user_services.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:flutter/material.dart';

class CurrentUserProvider extends ChangeNotifier {
  final CurrentUserServices _currentUserServices = CurrentUserServices(
      collectionId: AppwriteConstant.usersCollectionId,
      databaseId: AppwriteConstant.databaseId,
      databases: AppwriteConstant().appWriteDatabases,
      storage: AppwriteConstant().appWriteStorage);

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  intit() async {
    var data = await SecureStorage().getUserDetails();

    if (data != null) {
      final user = UserModel.fromMap(jsonDecode(data));
      _userModel = user;
      notifyListeners();
    }
  }

  getCurrentUser() async {
    final (isSuccess, user) = await _currentUserServices.getUserDetails();
    if (isSuccess) {
      _userModel = user;
      notifyListeners();
    }
  }
}
