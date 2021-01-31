import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  bool _isDarkMode;

  ThemeBloc({this.sharedPreferences}) {
    bool value = sharedPreferences.getBool('isDarkModeEnabled') ?? false;
    _isDarkMode = value;
    sharedPreferences.setBool('isDarkModeEnabled', _isDarkMode);
  }

  ThemeData get currentTheme =>
      _isDarkMode ? _getThemeDark() : _getThemeLight();

  ThemeData get getThemeDark => _getThemeDark();
  ThemeData get getThemeLight => _getThemeLight();

  bool get isDarkMode => _isDarkMode;

  void setDarkMode(bool b) {
    sharedPreferences.setBool('isDarkModeEnabled', b);
    _isDarkMode = b;
    // print("isDarkModeEnabled $b");
    notifyListeners();
  }

  ThemeData _getThemeLight() {
    // print("modo claro");
    final theme = ThemeData(
      primarySwatch: Colors.blue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
    );
    return theme;
  }

  ThemeData _getThemeDark() {
    // print("modo negro");
    final theme = ThemeData.dark().copyWith(
      accentColor: Colors.red,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.red,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      toggleableActiveColor: Colors.blue,
    );
    return theme;
  }
}
