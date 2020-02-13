import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
  accentColor: Color(0xffff4d00),
  primaryColor: Color(0xff243B55),
  primaryColorDark: Color(0xff141E30),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800,
      color: Colors.white,
      fontSize: 42.0,
    ),
    headline2: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 28.0,
    ),
    headline3: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 20.0,
    ),
    caption: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      color: Colors.black87,
      fontSize: 14.0,
    ),
    overline: TextStyle(
      fontFamily: 'Lato',
      color: Colors.white.withOpacity(0.9),
      fontSize: 18.0,
    ),
  ),
);
