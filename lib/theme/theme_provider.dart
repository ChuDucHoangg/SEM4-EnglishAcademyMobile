import 'package:flutter/material.dart';
import 'package:english_academy_mobile/theme/theme_helper.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme;

  ThemeProvider({required ThemeData initTheme}) {
    _currentTheme = initTheme;
  }

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) {
    ThemeHelper().toggleTheme(context);
  }
}
