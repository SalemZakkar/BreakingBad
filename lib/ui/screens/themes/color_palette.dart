import 'package:flutter/material.dart';

class ColorPallet extends StatefulWidget {
  final ThemeData themeData;

  const ColorPallet({Key? key, required this.themeData}) : super(key: key);

  @override
  State<ColorPallet> createState() => _ColorPalletState();
}

class _ColorPalletState extends State<ColorPallet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          colorContainer(widget.themeData.primaryColor),
          colorContainer(widget.themeData.scaffoldBackgroundColor),
          colorContainer(widget.themeData.cardColor),
          colorContainer(widget.themeData.textTheme.bodyText1!.color!),
        ],
      ),
    );
  }
}

Widget colorContainer(Color color) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black),
        ),
      ));
}
