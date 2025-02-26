import 'dart:convert';
import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:dating_app/apis/current_user_services.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CurrentUserProvider extends ChangeNotifier {
  final CurrentUserServices _currentUserServices = CurrentUserServices(
      collectionId: AppwriteConstant.usersCollectionId,
      databaseId: AppwriteConstant.databaseId,
      databases: AppwriteConstant().appWriteDatabases,
      storage: AppwriteConstant().appWriteStorage);

  File? image;
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

  Future<File?> _pickImage(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      image = File(file.path);
      notifyListeners();
      return File(file.path);
    }
  }

  Future pickImageAndUpload(ImageSource source) async {
    final image = await _pickImage(source);
    if (image != null) {
      if (userModel?.profileUrl != null) {
        final imgId = AppwriteConstant.getFileIdFromUrl(userModel!.id);
        if (imgId != null) {
          _currentUserServices.deleteProfilePic(id: imgId);
        }
      }
      final (isSuccess, url) =
          await _currentUserServices.uploadUserProfilePic(image);
      if (isSuccess) {
        _userModel = _userModel!.copyWith(profileUrl: url);
        notifyListeners();
        await _currentUserServices.updateUserDetails(_userModel!);
      }
    }

    try {} on AppwriteException catch (error) {
    } catch (e) {}
  }
}
