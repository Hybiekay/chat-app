import 'package:flutter/material.dart';

extension ThemeExtention on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isDark => theme.brightness == Brightness.dark;
}
