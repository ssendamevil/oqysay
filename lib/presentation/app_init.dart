import 'package:binderbee/data/datasources/entities/token_entity.dart';
import 'package:binderbee/data/datasources/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fresh_dio/fresh_dio.dart';
import '../data/datasources/entities/settings_entity.dart';
import '../data/datasources/hives.dart';

class AppInitializer{
  static const String _host = 'https://oqysay-backend.onrender.com';

  static Future<Dio> initialize() async{
    await Hive.initFlutter();
    Hive.registerAdapter(TokenEntityAdapter());
    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(SettingsEntityAdapter());
    await Hive.openBox<SettingsEntity>(Hives.boxSettings);
    await Hive.openBox<TokenEntity>(Hives.boxToken);
    await Hive.openBox<UserEntity>(Hives.boxUsers);

    BaseOptions options = BaseOptions(
      baseUrl:_host,
      // connectTimeout: 10000,
      // receiveTimeout: 10000,
    );

    final dio = Dio(options);

    return dio;
  }

}