import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    cardColor: Colors.black26,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(color: Colors.white),

  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.black),
    colorScheme: ColorScheme.light(),
    cardColor: Colors.grey.shade500,
    iconTheme: IconThemeData(color: Colors.black),

  );
}