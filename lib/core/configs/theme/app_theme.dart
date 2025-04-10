import 'package:flutter/material.dart';

class AppTheme {
  static final appThemeLight = ThemeData(
    primaryColor: Color(0xFFFF7622),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF7622),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 62),
      ),
    ),
  );
}