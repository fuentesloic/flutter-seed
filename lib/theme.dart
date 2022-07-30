import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: "Open Sans",
    textTheme: const TextTheme(
      headline6: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
      headline5: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontFamily: "Open Sans"),
      headline4: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
      headline3: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w300,
          fontFamily: "Open Sans"),
      subtitle2: TextStyle(
          color: Color(0xFF8C8C8C),
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: "Open Sans"),
      headline1: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: "Open Sans"),
      subtitle1: TextStyle(
          color: Color(0xFF1C2028),
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: "Open Sans"),
      button: TextStyle(
          color: Color(0xFF1C2028),
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFF0CE8CE),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    accentColor: const Color(0xFF0CE8CE),
    primaryColor: const Color(0xFF2C3039),
    canvasColor: Colors.grey,
    cardColor: const Color(0xFF2C3039),
    cursorColor: const Color(0xFF2C3039),
    unselectedWidgetColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF1C2028),
    backgroundColor: const Color(0xFF1C2028),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.red,
      actionTextColor: Colors.white,
      contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Color(0xFF1C2028)),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(color: Color(0xFF0CE8CE)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFF0CE8CE),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        fontFamily: "Open Sans",
      ),
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFF0CE8CE),
      secondary: Colors.transparent,
      surface: Colors.transparent,
      background: Color(0xFF1C2028),
      error: Colors.red,
      onPrimary: Color(0xFF1C2028),
      onSecondary: Colors.transparent,
      onSurface: Colors.white,
      onBackground: Colors.transparent,
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xFF1C2028),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
