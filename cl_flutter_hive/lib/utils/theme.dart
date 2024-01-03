import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late SharedPreferences prefs;

  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      secondary: Colors.tealAccent.shade700,
    ),
    primaryColor: Colors.orange,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.grey.shade300,
        ),
  );

  final dartTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      secondary: Colors.tealAccent,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    primaryColor: Colors.orange,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.teal.shade500,
        ),
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dartTheme : lightTheme;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dartTheme) {
      _selectedTheme = lightTheme;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dartTheme;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
