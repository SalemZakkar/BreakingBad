part of 'theme_mode_cubit.dart';

@immutable
abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {
  final ThemeData activeTheme = AppTheme.light;
}
class ThemeModeDark extends ThemeModeState {
  final ThemeData activeTheme = AppTheme.dark;
}
class ThemeModeLight extends ThemeModeState {
  final ThemeData activeTheme = AppTheme.light;
}
