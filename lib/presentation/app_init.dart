import 'package:dio/dio.dart';

class AppInitializer{
  static const String _host = 'http://10.0.2.2:8000/';

  static Future<Dio> initialize() async{
    BaseOptions options =BaseOptions(
      baseUrl:_host
    );

    final dio = Dio(options);

    return dio;
  }
}