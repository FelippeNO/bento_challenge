import 'package:flutter/material.dart';

import 'ui_colors.dart';

class UIThemeData {
  static const _primaryColor = UIColors.shamrock;
  static const _secondaryColor = UIColors.fringyFlower;
  static const _darkestColor = UIColors.blueZodiac;
  static const _lightestColor = UIColors.alabaster;

  static ThemeData normalTheme = ThemeData(
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _lightestColor,
    appBarTheme: const AppBarTheme(
      color: _lightestColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _darkestColor,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      titleLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: 'Nunito',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _lightestColor,
        backgroundColor: _secondaryColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: _secondaryColor,
        foregroundColor: _primaryColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all<Color>(_primaryColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(_primaryColor),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
        _primaryColor.value,
        const <int, Color>{
          50: Color(0xFFe0f1f2),
          100: Color(0xFFb0dcdf),
          200: Color(0xFF7dc6ca),
          300: Color(0xFF47afb3),
          400: Color(0xFF1a9ea1),
          500: Color(0xFF008e8f),
          600: Color(0xFF008181),
          700: Color(0xFF007270),
          800: Color(0xFF006260),
          900: Color(0xFF004643),
        },
      ),
      accentColor: _secondaryColor,
    ),
  );
}
