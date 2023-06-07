import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<LoadLanguageEvent>(_onLoadLanguage);
  }

  Future<void> _onLoadLanguage(LoadLanguageEvent event, Emitter<LanguageState> emit) async{
    try{
      emit(state.copyWith(locale: event.locale));
    }catch (e){

    }
  }

}
