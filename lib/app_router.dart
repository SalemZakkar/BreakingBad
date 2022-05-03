import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/ui/screens/character/character.dart';
import 'package:breaking_bad/ui/screens/home/home.dart';
import 'package:breaking_bad/ui/screens/themes/themes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = "/home";
  static const String appThemes = "/appThemes";
  static const String character = "/character";

  static Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case appThemes:
        return MaterialPageRoute(builder: (context) => const Themes());
      case character:
        return MaterialPageRoute(
            builder: (context) => CharacterView(
                  character: settings.arguments as Character,
                ));
    }
    return null;
  }
}
