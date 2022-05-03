import 'package:bloc/bloc.dart';
import 'package:breaking_bad/logs/messages.dart';
import 'package:breaking_bad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());

  void setTheme(int theme) {
    Messages.setTheme(theme.toString());
    emit(ThemeModeChange(theme));
  }
}
