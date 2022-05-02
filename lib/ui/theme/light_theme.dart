import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(50, 111, 106, 1),
    primarySwatch: Colors.green,
    cardColor: const Color.fromRGBO(241, 241, 241, 0.8),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Color.fromRGBO(255, 90, 95, 1)),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Color.fromRGBO(241, 241, 241, 0.8))));
