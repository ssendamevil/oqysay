import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalization{
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context){
    return Localizations.of(context, AppLocalization);
  }

  late Map<String, String> _localizedValues;

  Future<void> loadJson() async{
    String jsonStringValues = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslatedValues(String key){
    return _localizedValues[key];
  }

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('kk', 'KZ'),
    Locale('ru', 'RU')
  ];

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  static const localizationsDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    delegate
  ];

  static Locale? localeResolutionCallBack(Locale? locale, Iterable<Locale>? supportedLocales){
    if(supportedLocales != null && locale != null){
      return supportedLocales.firstWhere((element) =>
      element.languageCode == locale.languageCode,
          orElse: ()=> supportedLocales.elementAt(1));
    }

    return null;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'kk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async{
    AppLocalization localization = AppLocalization(locale);
    await localization.loadJson();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}