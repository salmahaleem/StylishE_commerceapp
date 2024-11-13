import 'package:flutter/material.dart';
import 'package:stylishecommerce/core/utils/colors.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsMang.stylishRed,
    scaffoldBackgroundColor: ColorsMang.backgroundPage,
    appBarTheme: AppBarTheme(
      color: ColorsMang.backgroundPage,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium:
      TextStyle(color: ColorsMang.stylishRed, fontWeight: FontWeight.bold),
      displayLarge:
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: ColorsMang.textInField),
      labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsMang.stylishRed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorsMang.stylishRed,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: ColorsMang.stylishRed),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: ColorsMang.borderInField),

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsMang.stylishRed,
    scaffoldBackgroundColor: Colors.black26,
    appBarTheme: const AppBarTheme(
      color: Colors.black26,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 16, color: ColorsMang.backgroundTextField),
      labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsMang.stylishRed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorsMang.stylishRed,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorsMang.stylishRed,
        side: BorderSide(color: ColorsMang.stylishRed),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: ColorsMang.borderInField),
  );

}