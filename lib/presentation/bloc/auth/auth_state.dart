part of 'auth_bloc.dart';

enum AuthStateType {initial, isLoading, success, failure}


class AuthState extends Equatable {
  final AuthStateType state;
  final bool? isLogin;

  const AuthState({
    this.isLogin,
    this.state = AuthStateType.initial,
  });

  AuthState copyWith ({
    AuthStateType? state,
    bool? isLogin,
  }){
    return AuthState(
      state: state ?? this.state,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();

}

