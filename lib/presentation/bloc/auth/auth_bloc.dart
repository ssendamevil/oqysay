import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegistrationEvent>(_onRegistration);
  }



  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {

  }

  Future<void> _onRegistration(AuthRegistrationEvent event, Emitter<AuthState> emit) async {

  }
}
