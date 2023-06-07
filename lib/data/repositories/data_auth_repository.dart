import 'package:binderbee/data/datasources/entities/token_entity.dart';
import 'package:binderbee/domain/models/user.dart';
import 'package:binderbee/domain/repositories/auth_repository.dart';
import 'package:binderbee/presentation/providers/auth_network_provider.dart';
import 'package:dio/dio.dart';

class DataAuthRepository extends AuthRepository{

  final AuthNetworkProvider _authNetworkProvider;

  DataAuthRepository(Dio dio) : _authNetworkProvider = AuthNetworkProvider(dio) ;

  @override
  Future<User> login(String email, String password) {
    return _authNetworkProvider.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String name, String surname) {
    return _authNetworkProvider.register(email, password, name, surname);
  }

}