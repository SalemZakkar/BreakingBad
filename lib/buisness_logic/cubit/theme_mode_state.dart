part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {
  final ThemeData activeTheme = AppTheme.light;
}

class ThemeModeChange extends ThemeModeState {
  final int index;

  ThemeModeChange(this.index);
}
