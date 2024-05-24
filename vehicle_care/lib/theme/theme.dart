import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'Jura',
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 240, 240, 240),
    onBackground: Color.fromRGBO(255, 255, 255, 1),
    primary: Color(0xff1B0950),
    secondary: Color(0xff050309),
    tertiary: Color(0xffD9D9D9),
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'Jura',
  colorScheme: const ColorScheme.dark(
    background: Color(0xff0c0b0c),
    onBackground: Color(0xff050309),
    primary: Color(0xff1B0950),
    secondary: Color(0xffffffff),
    tertiary: Color(0xff3F3F3F),    
  )
);