import "package:dating_app/core/theme/custom_textstyle.dart";
import "package:flutter/material.dart";

class CustomTheme {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xff1e1e1e),
      primaryColor: Color(0xff5ebaae),
      buttonTheme: ButtonThemeData(
          buttonColor: Color(0xff5ebaae),
          minWidth: double.infinity,
          height: 45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff5ebaae),
          minimumSize: Size(double.infinity, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: inputDesign(),
    );
  }

  static InputDecorationTheme inputDesign() {
    return InputDecorationTheme(
      hintStyle: CustomTextstyle.caption,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff5ebaae),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff5ebaae),
          width: 2,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff5ebaae),
          width: 3,
        ),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xffffffff),
        primaryColor: Color(0xff5ebaae),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff5ebaae),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // textStyle: TextStyle(color: Colors.black)
          ),
        ),
        inputDecorationTheme: inputDesign());
  }
}
