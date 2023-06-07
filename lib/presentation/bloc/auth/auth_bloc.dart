import 'dart:async';

import 'package:binderbee/data/datasources/entities/user_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../data/datasources/box_helper.dart';
import '../../../data/datasources/entities/token_entity.dart';
import '../../../domain/models/user.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegistrationEvent>(_onRegistration);
    on<AuthLogoutEvent>(_onLogout);
  }



  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    try{
      late User user;
      emit(state.copyWith(state: AuthStateType.isLoading, isLogin: false));
      user = await _authRepository.login(event.email, event.password);
      BoxHelper.saveToken(user.tokens);
      BoxHelper.saveUser(UserEntity(user.name, user.surname, user.id, user.email,user.status));
      emit(state.copyWith(state: AuthStateType.success, user: user, isLogin: true));
    }catch (e){
      emit(state.copyWith(state: AuthStateType.failure));
    }
  }

  Future<void> _onRegistration(AuthRegistrationEvent event, Emitter<AuthState> emit) async {
    try{
      late User user;
      emit(state.copyWith(state: AuthStateType.isLoading, isLogin: false));
      user = await _authRepository.register(event.email, event.password, event.username, event.username);
      BoxHelper.saveToken(user.tokens);
      BoxHelper.saveUser(UserEntity(user.name, user.surname, user.id, user.email,user.status));
      emit(state.copyWith(state: AuthStateType.success, user: user, isLogin: true));
    }catch (e){
      emit(state.copyWith(state: AuthStateType.failure));
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try{
      BoxHelper.deleteToken();
      BoxHelper.deleteUser();
    }catch (e){

    }
  }
}
