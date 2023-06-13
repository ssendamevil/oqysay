import 'dart:async';
import 'package:binderbee/data/datasources/box_helper.dart';
import 'package:binderbee/data/datasources/entities/settings_entity.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:io';


part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  Future<void> _onChangeLanguage(ChangeLanguageEvent event, Emitter<SettingsState> emit) async{
    try{
      emit(state.copyWith(locale: event.locale,isLangChanged: true));
      BoxHelper.saveSettings(SettingsEntity(event.locale.languageCode, '${BoxHelper.getSettings()?.theme}', state.isLoggedIn, '${event.locale.countryCode}', true));
    }catch (e){}
  }

  Future<void> _onChangeTheme(ChangeThemeEvent event, Emitter<SettingsState> emit) async{
    try{
      emit(state.copyWith(theme: event.themeMode,));
      BoxHelper.saveSettings(SettingsEntity('${BoxHelper.getSettings()?.language}',event.themeMode.name, state.isLoggedIn, '${BoxHelper.getSettings()?.countryCode}', false));
    }catch (e){

    }
  }

}
