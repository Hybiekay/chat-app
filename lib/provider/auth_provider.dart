import 'package:appwrite/appwrite.dart';
import 'package:dating_app/apis/auth_services.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/core/helper/custom_snack_bar.dart';
import 'package:dating_app/model/user_model.dart';
import 'package:dating_app/view/home_screen.dart';
import 'package:dating_app/view/upload_image.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService = AuthService(
      account: AppwriteConstant().appWriteAccount,
      databases: AppwriteConstant().appWriteDatabases,
      dbId: AppwriteConstant.databaseId,
      userCollectionId: AppwriteConstant.usersCollectionId);
  bool isLoarding = false;

  Future login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    isLoarding = true;
    notifyListeners();
    final (isSucces, message) =
        await authService.login(email: email, password: password);
    if (isSucces) {
      CustomSnackBar.succes(context: context, message: message);
      isLoarding = false;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      CustomSnackBar.error(context: context, message: message);
      isLoarding = false;
      notifyListeners();
    }
  }

  Future register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    isLoarding = true;
    notifyListeners();

    UserModel userModel =
        UserModel(id: ID.unique(), email: email, about: "", name: name);
    final (isSucces, message) =
        await authService.register(userModel: userModel, password: password);
    if (isSucces) {
      CustomSnackBar.succes(context: context, message: message);
      isLoarding = false;
      notifyListeners();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UploadImage(id: userModel.id)));
    } else {
      CustomSnackBar.error(context: context, message: message);
      isLoarding = false;
      notifyListeners();
    }
  }
}
