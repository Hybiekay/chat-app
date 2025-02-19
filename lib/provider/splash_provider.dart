import 'package:appwrite/appwrite.dart';
import 'package:dating_app/core/helper/secure_storage.dart';
import 'package:dating_app/provider/auth_provider.dart';
import 'package:dating_app/provider/current_user_provider.dart';
import 'package:dating_app/view/home_screen.dart';
import 'package:dating_app/view/login_page.dart';
import 'package:dating_app/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier {
  AuthProvider authProvider = AuthProvider();
  nextPage(BuildContext context) async {
    Future.delayed(Duration(seconds: 3), () async {
      try {
        final user = await authProvider.authService.account.get();
        SecureStorage().saveUserId(user.$id);
        context.read<CurrentUserProvider>().getCurrentUser();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } on AppwriteException catch (e) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()));
      }
    });
  }
}
