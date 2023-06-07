import '../../../domain/models/book.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddBookToCartEvent extends CartEvent{
  final Book book;

  const AddBookToCartEvent(this.book);
}

class DeleteBookToCartEvent extends CartEvent{
  final Book book;

  const DeleteBookToCartEvent(this.book);
}
