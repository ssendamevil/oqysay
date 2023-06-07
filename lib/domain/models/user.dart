import 'package:equatable/equatable.dart';

import '../../data/datasources/entities/token_entity.dart';

class User extends Equatable{
  final String name;
  final String surname;
  final String id;
  final String email;
  final String status;
  final TokenEntity tokens;

  const User({
    required this.name,
    required this.surname,
    required this.id,
    required this.email,
    required this.status,
    required this.tokens,
  });

  @override
  List<Object?> get props => [ id, name, surname ];
}