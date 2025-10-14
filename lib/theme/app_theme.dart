import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData darkRedTheme = ThemeData(
    primaryColor: const Color(0xFF3F0FB7),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3F0FB7),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white10,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      labelStyle: TextStyle(color: Colors.white70),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: const Color.fromARGB(255, 80, 71, 197)),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
