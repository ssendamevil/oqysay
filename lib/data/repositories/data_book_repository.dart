
import 'package:binderbee/domain/models/book.dart';
import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/providers/book_network_provider.dart';
import 'package:dio/dio.dart';

class DataBookRepository extends BookRepository{
  final BookNetworkProvider _bookNetworkProvider;

  DataBookRepository(Dio dio) : _bookNetworkProvider = BookNetworkProvider(dio);


  @override
  Future<List<Book>> getAllBooks() {
    return _bookNetworkProvider.getAllBooks();
  }

}