import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(50, 111, 106, 1),
    primarySwatch: Colors.green,
    cardColor: const Color.fromRGBO(0, 51, 102, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(0, 35, 58, 1),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Color.fromRGBO(190, 215, 235, 1))));
