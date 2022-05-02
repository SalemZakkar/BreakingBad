import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: const Color.fromRGBO(50, 111, 106, 1),
    primarySwatch: Colors.green,
    cardColor: const Color.fromRGBO(10, 55, 85, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(10, 55, 85, 1),
    iconTheme: const IconThemeData(color: Color.fromRGBO(255, 90, 95, 1)),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Color.fromRGBO(190,215,235, 1))));
