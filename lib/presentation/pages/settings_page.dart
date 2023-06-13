import 'package:binderbee/presentation/bloc/settings/settings_bloc.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${AppLocalization.of(context).getTranslatedValues("settings")}',
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Text('${AppLocalization.of(context).getTranslatedValues("settings_language")}'),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => context.read<SettingsBloc>().add(ChangeLanguageEvent(locale: const Locale('ru', 'RU'))),
                        child: Text('${AppLocalization.of(context).getTranslatedValues("lang_to_russian")}')
                    ),
                    ElevatedButton(
                        onPressed: () => context.read<SettingsBloc>().add(ChangeLanguageEvent(locale: const Locale('kk', 'KZ'))),
                        child: Text('${AppLocalization.of(context).getTranslatedValues("lang_to_kazakh")}')
                    ),
                    ElevatedButton(
                        onPressed: () => context.read<SettingsBloc>().add(ChangeLanguageEvent(locale: const Locale('en', 'US'))),
                        child: Text('${AppLocalization.of(context).getTranslatedValues("lang_to_english")}')
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text('${AppLocalization.of(context).getTranslatedValues("app_thememode")}'),
                ElevatedButton(
                    onPressed: () => context.read<SettingsBloc>().add(ChangeThemeEvent(themeMode: ThemeMode.dark)),
                    child: Text('Dark' )
                ),
                ElevatedButton(
                    onPressed: () => context.read<SettingsBloc>().add(ChangeThemeEvent(themeMode: ThemeMode.light)),
                    child: Text('Light' )
                ),
                ElevatedButton(
                    onPressed: () => context.read<SettingsBloc>().add(ChangeThemeEvent(themeMode: ThemeMode.system)),
                    child: Text('System' )
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
