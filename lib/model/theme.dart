import 'package:flutter/material.dart';

class Theme {
  bool isDarkMode;
  ThemeData themeData;

  Theme({
    required this.isDarkMode,
    required this.themeData,
  });

  factory Theme.light() {
    return Theme(
      isDarkMode: false,
      themeData: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.blue[500], // 主要顏色，通常用於 AppBar 的背景色等
          secondary: Colors.blue[400], // 背景顏色，通常用於 Scaffold 的背景色
          surface:  Colors.blue[100], // 表面顏色，通常用於 Card 的背景色等
          onPrimary: Colors.white, // 在主要顏色上的文字顏色
          onSecondary: Colors.white, // 在背景顏色上的文字顏色
          onSurface: Colors.blue[900], // 在表面顏色上的文字顏色
        ),
      ),
    );
  }

  factory Theme.dark() {
    return Theme(
      isDarkMode: true,
      themeData: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.deepPurple[400], // 主要顏色，通常用於 AppBar 的背景色等
          secondary: Colors.grey[700], // 背景顏色，通常用於 Scaffold 的背景色
          surface: Colors.grey[850], // 表面顏色，通常用於 Card 的背景色等
          onPrimary: Colors.white, // 在主要顏色上的文字顏色
          onSecondary: Colors.white, // 在背景顏色上的文字顏色
          onSurface: Colors.deepPurple[200], // 在表面顏色上的文字顏色
        ),
      ),
    );
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    themeData = isDarkMode ? Theme.dark().themeData : Theme.light().themeData;
  }
}
