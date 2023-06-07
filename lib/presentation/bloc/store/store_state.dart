import '../../../domain/models/book.dart';

enum StoreRequest{
  unknown,
  inProgress,
  successRequest,
  failureRequest,
}

class StoreState {
  const StoreState({
    this.books = const [],
    this.booksStatus = StoreRequest.unknown,
    this.failureMessage,
  });

  final List<Book> books;
  final StoreRequest booksStatus;
  final String? failureMessage;

  StoreState copyWith({
    List<Book>? books,
    StoreRequest? booksStatus,
    String? failureMessage,
  }) => StoreState(
          books: books ?? this.books,
          booksStatus: booksStatus ?? this.booksStatus,
          failureMessage: failureMessage,
        );

}


