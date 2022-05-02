import 'package:breaking_bad/buisness_logic/cubit/theme_mode_cubit.dart';
import 'package:breaking_bad/data/strings.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  late bool state;
  late Icon light;
  late Icon dark;
  @override
  Widget build(BuildContext context) {
    ThemeModeState themeModeState = BlocProvider.of<ThemeModeCubit>(context).state;
    ThemeData themeData = Theme.of(context);
    light =  Icon(Icons.wb_sunny , color: themeData.iconTheme.color,);
    dark =   Icon(Icons.nightlight_round , color: themeData.iconTheme.color,);
    state = themeModeState is ThemeModeLight;
    return IconButton(
        onPressed: () {
          if(state)
            {
              AppTheme.setTheme(APPStrings.darkTheme);
            }
          else
            {
              AppTheme.setTheme(APPStrings.lightTheme);
            }
          setState(() {
            state = themeModeState is ThemeModeLight;
          });
        },
        icon: (state ? dark : light));
  }
}
