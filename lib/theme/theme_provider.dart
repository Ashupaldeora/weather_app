import 'package:flutter/material.dart';
import 'package:weather_app/theme/dark_theme.dart';
import 'package:weather_app/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
      _isDark = true;
    } else {
      _themeData = lightTheme;
      _isDark = false;
    }
    notifyListeners();
  }
}
