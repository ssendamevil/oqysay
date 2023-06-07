import 'package:binderbee/data/datasources/entities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/user.dart';
import 'entities/token_entity.dart';
import 'hives.dart';

class BoxHelper{
  static bool hasToken(){
    return Hive.box<TokenEntity>(Hives.boxToken).get(Hives.keyToken) != null;
  }

  static bool isLoggedIn(){
    return Hive.box(Hives.boxSettings).get(Hives.keyIsLoggedIn);
  }

  static void saveToken(TokenEntity token){
    Hive.box<TokenEntity>(Hives.boxToken).put(Hives.keyToken, token);
  }

  static void deleteToken(){
    Hive.box<TokenEntity>(Hives.boxToken).delete(Hives.keyToken);
  }

  static void saveUser(UserEntity user){
    Hive.box<UserEntity>(Hives.boxUsers).put(Hives.keyMyUser, user);
  }

  static void deleteUser(){
    Hive.box<UserEntity>(Hives.boxUsers).delete(Hives.keyMyUser);
  }

  static UserEntity? getUserInfo(){
    return Hive.box<UserEntity>(Hives.boxUsers).get(Hives.keyMyUser);
  }
}