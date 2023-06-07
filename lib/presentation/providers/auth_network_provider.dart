
import 'package:binderbee/domain/models/user.dart';
import 'package:dio/dio.dart';

import '../../data/datasources/entities/token_entity.dart';

class AuthNetworkProvider{
  final Dio _dio;

  AuthNetworkProvider(this._dio);

  Future<User> register(String email, String password, String name, String surname) async{
    var response = await _dio.post('/api/registration', data: {
      'email': email,
      'password': password,
      'name' : name,
      'surname' : surname,
    });
    return User(
        name: response.data["user"]["name"],
        surname: response.data["user"]["surname"],
        id: response.data["user"]["id"],
        email: response.data["user"]["email"],
        status: response.data["user"]["status"],
        tokens: TokenEntity(response.data['accessToken'], response.data['refreshToken'])
    );
  }


  Future<User> login(String email, String password) async{
    var response = await _dio.post('/api/login', data: {
      'email': email,
      'password': password
    });

    return User(
        name: response.data["user"]["name"],
        surname: response.data["user"]["surname"],
        id: response.data["user"]["id"],
        email: response.data["user"]["email"],
        status: response.data["user"]["status"],
        tokens: TokenEntity(response.data['accessToken'], response.data['refreshToken'])
    );
  }
}