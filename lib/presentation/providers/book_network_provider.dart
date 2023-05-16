import 'package:dio/dio.dart';

import '../../domain/models/book.dart';

class BookNetworkProvider {
  final Dio _dio;

  BookNetworkProvider(this._dio);

  Future<List<Book>> getAllBooks() async{
    var response = await _dio.get('api/books/');
    return _parseBook(response.data);
  }

  List<Book> _parseBook(dynamic e) {
    return (e as List)
        .map((json) =>
            Book(
                title: json['name'],
                image: json['image'] == null ? "" : json['image'][0].toString(),
                authorName: json['auhtor'] == null ? "" : json['author'][0].toString()
            )
        ).toList();
  }
}