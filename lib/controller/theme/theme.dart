import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
        ),
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black));
  }

  static ThemeData dartTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
      ),
      primarySwatch: Colors.teal,
    );
  }
}
