import '../../../domain/models/book.dart';

enum CartStateType{
  inProgress,
  success,
  failure,
  initial
}

class CartState {
  final List<Book> cartItems;
  final CartStateType state;

  CartState({
    this.cartItems = const [],
    this.state = CartStateType.initial
  });

  CartState copyOf({
    List<Book>? cartItems,
    CartStateType? cartStateType
  }) => CartState(
    cartItems: cartItems ?? this.cartItems,
    state: cartStateType ?? state
  );

}
