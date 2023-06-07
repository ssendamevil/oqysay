

import 'package:binderbee/domain/models/user.dart';

import '../../data/datasources/entities/token_entity.dart';

abstract class AuthRepository{
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name, String surname);

}