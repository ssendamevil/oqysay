part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class ChangeLanguageEvent extends SettingsEvent{
  final Locale locale;

  ChangeLanguageEvent({required this.locale});
}

class ChangeThemeEvent extends SettingsEvent{
  final ThemeMode themeMode;

  ChangeThemeEvent({required this.themeMode});
}