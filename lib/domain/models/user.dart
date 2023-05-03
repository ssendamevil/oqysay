import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String name;
  final String surname;
  final String id;

  const User({
    required this.name,
    required this.surname,
    required this.id,
  });

  @override
  List<Object?> get props => [ id, name, surname ];
}