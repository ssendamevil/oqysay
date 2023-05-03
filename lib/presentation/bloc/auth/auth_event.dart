part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {

}

class AuthRegistrationEvent extends AuthEvent {


  @override
  List<Object?> get props => throw UnimplementedError();

}

class AuthLoginEvent extends AuthEvent{


  @override
  List<Object?> get props => throw UnimplementedError();

}
