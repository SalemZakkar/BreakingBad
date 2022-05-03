import 'package:breaking_bad/ui/screens/themes/theme_card.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AppThemes",
          textScaleFactor: 1.1,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ThemeCard(index: index);
          },
          itemCount: appThemes.length,
        ),
      ),
    );
  }
}
