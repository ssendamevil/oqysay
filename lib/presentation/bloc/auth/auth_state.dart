part of 'auth_bloc.dart';

enum AuthStateType {initial, isLoading, success, failure}


class AuthState extends Equatable {
  final AuthStateType state;
  final bool isLogin;
  final User user;

  const AuthState({
    this.isLogin = false,
    this.state = AuthStateType.initial,
    this.user = const User(name: " ", surname: "", email: "", id: "", status: "", tokens: TokenEntity('','')),
  });

  AuthState copyWith ({
    AuthStateType? state,
    bool? isLogin,
    User? user
  }){
    return AuthState(
      state: state ?? this.state,
      isLogin: isLogin ?? this.isLogin,
      user: user ?? this.user
    );
  }

  @override
  List<Object?> get props => [ state, isLogin, ];

}

