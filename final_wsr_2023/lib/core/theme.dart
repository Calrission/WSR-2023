import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    helperStyle: TextStyle(
      color: Color(0xFFA7A7A7),
    ),
    hintStyle: TextStyle(
        color: Color(0xFFCFCFCF)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA7A7A7))
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA7A7A7))
    ),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFED3A3A))
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 14,
      color: Colors.white
    ),
    headlineLarge: TextStyle(
      color: Color(0xFF0560FA),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
        color: Color(0xFF3A3A3A),
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    titleLarge: TextStyle(
      color: Color(0xFF3A3A3A),
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Color(0xFFA7A7A7),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: Color(0xFF3A3A3A),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        return (states.contains(MaterialState.selected)) ? const Color(0xFF0560FA) : const Color(0xFFFFFFFF);
      }),
      side: const BorderSide(
        color: Color(0xFF006CEC),
      )
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
        side: const BorderSide(color: Color(0xFF0560FA)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
      )
  ),
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
          backgroundColor: const Color(0xFF0560FA),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
          disabledBackgroundColor: const Color(0xFFA7A7A7),
          disabledForegroundColor: Colors.white
      )
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0560FA),
      primary: const Color(0xFF0560FA)
  ),
  useMaterial3: true,
);




var darkTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    helperStyle: TextStyle(
      color: Color(0xFFA7A7A7),
    ),
    hintStyle: TextStyle(
        color: Color(0xFFCFCFCF)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA7A7A7))
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFA7A7A7))
    ),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFED3A3A))
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(fontSize: 14),
    headlineLarge: TextStyle(
      color: Color(0xFF0560FA),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
        color: Color(0xFF3A3A3A),
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    titleLarge: TextStyle(
      color: Color(0xFF3A3A3A),
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Color(0xFFA7A7A7),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: Color(0xFF3A3A3A),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        return (states.contains(MaterialState.selected)) ? const Color(0xFF0560FA) : const Color(0xFFFFFFFF);
      }),
      side: const BorderSide(
        color: Color(0xFF006CEC),
      )
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
        side: const BorderSide(color: Color(0xFF0560FA)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
      )
  ),
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
          backgroundColor: const Color(0xFF0560FA),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
          disabledBackgroundColor: const Color(0xFFA7A7A7),
          disabledForegroundColor: Colors.white
      )
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0560FA),
      primary: const Color(0xFF0560FA)
  ),
  useMaterial3: true,
);