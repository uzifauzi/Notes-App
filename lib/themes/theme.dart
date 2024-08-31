import 'package:flutter/material.dart';
import 'package:notes_app/themes/text_theme.dart';

const Color lightPrimaryColor = Color(0xFFFFFFFF);
const Color darkPrimaryColor = Color.fromARGB(150, 0, 0, 0);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    onPrimary: Color(0XFFFAF1F1),
    onPrimaryContainer: Color(0XFFA792F9),
    secondary: Color(0XFF181515),
    onSecondary: Color(0XFF181515),
    error: Color(0xFFFF3333),
  ),
  textTheme: myTextTheme,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    onPrimary: Color(0XFFFAF1F1),
    onPrimaryContainer: Color.fromARGB(255, 74, 64, 117),
    secondary: Color(0XFFF9F8F8),
    onSecondary: Color(0XFF181515),
    error: Color(0xFFFF3333),
  ),
  textTheme: myTextTheme,
);
