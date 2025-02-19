import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeProvider extends ChangeNotifier {
  FlutterSecureStorage storage = FlutterSecureStorage();
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get themeMode => _mode;

  ThemeProvider() {
    storage.read(key: "theme").then((value) {
      if (value == "dark") {
        _mode = ThemeMode.dark;
      } else if (value == "light") {
        _mode = ThemeMode.light;
      }
      notifyListeners();
    });
  }
  Future changeTheme(String mode) async {
    if (mode == "light") {
      _mode = ThemeMode.light;
      storage.write(key: 'theme', value: "light");
      notifyListeners();
    } else {
      _mode = ThemeMode.dark;
      storage.write(key: 'theme', value: "dark");
      notifyListeners();
    }
  }
}
