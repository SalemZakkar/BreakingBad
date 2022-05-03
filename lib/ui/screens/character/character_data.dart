import 'package:flutter/material.dart';

class CharacterInfo extends StatefulWidget {
  final String data;

  const CharacterInfo({Key? key, required this.data}) : super(key: key);

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: size.width * 0.9,
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: themeData.cardColor,
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          widget.data,
          textScaleFactor: 1.3,
          style: TextStyle(color: themeData.textTheme.bodyText1?.color!),
        ),
      ),
    );
  }
}
