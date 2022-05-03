import 'package:breaking_bad/buisness_logic/cubit/theme_mode_cubit.dart';
import 'package:breaking_bad/data/shared_preference/shared_preference.dart';
import 'package:breaking_bad/ui/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'dark_theme.dart';

class AppTheme {
  static ThemeData dark = darkTheme;
  static ThemeData light = lightTheme;
  static void setTheme(int theme)
  {
    optionService.setTheme(theme);
    themeModeCubit.setTheme(theme);
  }
  static int initTheme()
  {
    int theme = optionService.getTheme();
    themeModeCubit.setTheme(theme);
    return theme;
  }
}
ThemeModeCubit themeModeCubit = ThemeModeCubit();
List<ThemeData> appThemes = [
  lightTheme,
  darkTheme
];