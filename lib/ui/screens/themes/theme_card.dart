import 'package:breaking_bad/ui/screens/themes/color_palette.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeCard extends StatefulWidget {
  final int index;

  const ThemeCard({Key? key, required this.index}) : super(key: key);

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = appThemes[widget.index];
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          width: size.width * 0.9,
          height: 400,
          decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: BorderRadius.circular(25)),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => AppTheme.setTheme(widget.index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This Is The Text Color",
                  style: TextStyle(color: themeData.textTheme.bodyText1!.color),
                  textScaleFactor: 1.2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorPallet(themeData: themeData)
              ],
            ),
          )),
    );
  }
}
