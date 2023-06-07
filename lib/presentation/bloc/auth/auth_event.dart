part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthRegistrationEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  const AuthRegistrationEvent(this.email, this.password, this.username);


  @override
  List<Object?> get props => throw UnimplementedError();

}

class AuthLoginEvent extends AuthEvent{
  final String email;
  final String password;

  const AuthLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => throw UnimplementedError();

}

class AuthLogoutEvent extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
