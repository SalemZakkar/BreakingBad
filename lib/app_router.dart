
import 'package:breaking_bad/ui/screens/home/home.dart';
import 'package:flutter/material.dart';


class AppRouter {
  static const String home = "/home";
  static Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
    }
    return null;
  }
}
