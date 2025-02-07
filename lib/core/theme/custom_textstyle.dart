import 'package:flutter/material.dart';

class CustomTextstyle {
  static TextStyle get title {
    return TextStyle(
      fontFamily: "Caros",
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get subtitle {
    return TextStyle(
      fontFamily: "Caros",
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get body {
    return TextStyle(
      fontFamily: "Caros",
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get caption {
    return TextStyle(
      fontFamily: "Circular Std",
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }
}
