import 'package:dio/dio.dart';

import '../../domain/models/book.dart';

class BookNetworkProvider {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8000/api/'
  ));

  BookNetworkProvider();

  Future<List<Book>> getAllBooks() async{
    var response = await _dio.get('books');

    return _parseBook(response.data);
  }

  List<Book> _parseBook(dynamic e) {
    return (e as List)
        .map((json) =>
            Book(
                title: json['name'],
                image: json['image'][0],
                authorName: json['author']
            )
        ).toList();
  }
}