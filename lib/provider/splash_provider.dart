import 'package:dating_app/view/onboarding.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  nextPage(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }
}
