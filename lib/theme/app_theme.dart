import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;
  static Color hintColor = Colors.grey[800]!;
  static const Color backgroundColorLight = Colors.white;
  static const Color backgroundColorDark = Colors.black;
  static const Color textColorLight = Colors.black;
  static const Color textColorDark = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    hintColor: hintColor,
    scaffoldBackgroundColor: const Color(0xFFf3f3f3),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: backgroundColorLight),
        actionsIconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorLight),
      bodyMedium: TextStyle(color: textColorLight),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    listTileTheme:
        ListTileThemeData(selectedTileColor: Colors.blue.withOpacity(0.1)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    hintColor: hintColor,
    scaffoldBackgroundColor: backgroundColorDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorDark),
      bodyMedium: TextStyle(color: textColorDark),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: hintColor,
        elevation: 2,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    listTileTheme:
        ListTileThemeData(selectedTileColor: Colors.grey.withOpacity(0.3)),
  );
}
