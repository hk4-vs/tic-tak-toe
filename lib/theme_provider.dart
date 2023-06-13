import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme = true;

  themeProvider() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
