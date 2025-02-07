import 'package:dating_app/apis/auth_services.dart';
import 'package:dating_app/core/constants/appwrite_constant.dart';
import 'package:dating_app/core/helper/custom_snack_bar.dart';
import 'package:dating_app/view/home_screen.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService(
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
        await _authService.login(email: email, password: password);
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
}
