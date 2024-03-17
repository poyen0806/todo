import 'package:flutter/material.dart' hide Theme;
import 'package:todo/model/theme.dart';

class ThemeViewModel with ChangeNotifier {
  Theme? _theme;
  Theme? get theme => _theme;

  ThemeViewModel() {
    _theme = Theme.light(); // 初始為淺色模式
  }

  ThemeData get themeData => _theme!.themeData;

  void toggleTheme() {
    _theme?.toggleTheme();
    notifyListeners();
  }
}