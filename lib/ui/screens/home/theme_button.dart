import 'package:breaking_bad/app_router.dart';
// ignore: unused_import
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';


class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {

  @override
  Widget build(BuildContext context) {

    return IconButton(
        onPressed: () {
         Navigator.pushNamed(context, AppRouter.appThemes);
        },
        icon: const  Icon(Icons.settings )
    );
  }
}
