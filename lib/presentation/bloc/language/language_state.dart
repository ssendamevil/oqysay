part of 'language_bloc.dart';

@immutable
class LanguageState {
  final Locale locale;
  const LanguageState({
    this.locale = const Locale('kz','KZ')
  });

  LanguageState copyWith({
    Locale? locale
  }){
    return LanguageState(
        locale: locale ?? this.locale
    );
  }
}
