import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(50, 111, 106, 1),
    primarySwatch: Colors.green,
    cardColor: const Color.fromRGBO(241, 241, 241, 0.8),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
     inputDecorationTheme: const InputDecorationTheme(
         border: InputBorder.none,
         focusedBorder: InputBorder.none,
         enabledBorder: InputBorder.none,
         hintStyle: TextStyle(
             color: Colors.grey
         )

     ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle:  TextStyle(color: Colors.black ,  fontWeight: FontWeight.bold)
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black)));
