// ignore: file_names
import 'package:flutter/material.dart';

ThemeData MyTheme() {
  return ThemeData(
    // Colors
    primaryColor: Color(0xFF1FB545),
    hintColor: Color(0xFFFF9500),
    errorColor: Color(0xFFEF4949),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF2F2F7),

    // Typography
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
        letterSpacing: -0.38,
        //height: 34,
      ),
      headline2: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
        letterSpacing: -0.24,
        //height: 30,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700, // Bold
        color: Color(0xFF1A1A1A),
        letterSpacing: 0,
        //height: 25,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, //Semi-bold
        color: Color(0xFF1A1A1A),
        letterSpacing: -0.24,
        //height: 20,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
        color: Color(0xFF1A1A1A),
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
        color: Color(0xFF1A1A1A),
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400, // Regular
        color: Color(0xFF8E8E93),
        //height: 16,
      ),
    ),
  );
}
