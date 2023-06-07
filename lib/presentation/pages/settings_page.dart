import 'package:binderbee/presentation/bloc/language/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../language_selection/app_localization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${AppLocalization.of(context).getTranslatedValues("settings_language")}'),
            ElevatedButton(onPressed: () => context.read<LanguageBloc>().add(LoadLanguageEvent(locale: Locale('ru', 'RU'))), child: Text('${AppLocalization.of(context).getTranslatedValues("switch_to_russian")}')),
            ElevatedButton(onPressed: () => context.read<LanguageBloc>().add(LoadLanguageEvent(locale: Locale('kk', 'KZ'))), child: Text('${AppLocalization.of(context).getTranslatedValues("switch_to_kazakh")}')),
            ElevatedButton(onPressed: () => context.read<LanguageBloc>().add(LoadLanguageEvent(locale: Locale('en', 'US'))), child: Text('${AppLocalization.of(context).getTranslatedValues("switch_to_english")}')),
          ],
        ),
      ),
    );
  }
}
