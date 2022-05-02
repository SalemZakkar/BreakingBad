import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/shared_preference/shared_preference.dart';
import 'package:breaking_bad/data/strings.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());
  void setTheme(String theme)
  {
    Messages.setTheme(theme);
    if(theme == APPStrings.lightTheme)
      {
        emit(ThemeModeLight());
      }
    else
      {
        emit(ThemeModeDark());
      }
  }
}
