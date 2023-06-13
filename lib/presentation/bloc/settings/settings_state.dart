part of 'settings_bloc.dart';

class SettingsState {
  final Locale locale;
  final ThemeMode theme;
  final bool isLoggedIn;
  final bool isLangChanged;
  const SettingsState({
    this.locale = const Locale('kk', 'KZ'),
    this.theme = ThemeMode.system,
    this.isLoggedIn = false,
    this.isLangChanged = false,
  });

  SettingsState copyWith({
    Locale? locale,
    ThemeMode? theme,
    bool? isLoggedIn,
    bool? isLangChanged
  }){
    return SettingsState(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLangChanged: isLangChanged ?? this.isLangChanged
    );
  }

}
