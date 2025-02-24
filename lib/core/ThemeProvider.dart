import 'package:flutter/material.dart';
import 'package:shoppe_ui/core/AppTheme.dart'; // استبدل بالمسار الصحيح

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}