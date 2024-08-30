import 'package:flutter/material.dart';
import 'package:notes_app/themes/text_theme.dart';

const Color lightPrimaryColor = Color(0xFFFFFFFF);
const Color darkPrimaryColor = Color(0xFF231717);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    surface: lightPrimaryColor,
  ),
  textTheme: myTextTheme,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    surface: darkPrimaryColor,
  ),
  textTheme: myTextTheme,
);
