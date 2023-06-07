import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/book.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddBookToCartEvent>(_onAddBookToCart);
    on<DeleteBookToCartEvent>(_onDeleteBookToCart);
  }

  Future<void> _onAddBookToCart(AddBookToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyOf(cartStateType: CartStateType.inProgress));
    final List<Book> cartBooks = [...state.cartItems];
    if(!cartBooks.contains(event.book)){
      cartBooks.add(event.book);
    }
    emit(state.copyOf(cartItems: cartBooks, cartStateType: CartStateType.success));
  }

  Future<void> _onDeleteBookToCart(DeleteBookToCartEvent event, Emitter<CartState> emit) async {
    final List<Book> cartBooks = [...state.cartItems];
    if(state.cartItems.contains(event.book)){
      cartBooks.remove(event.book);
    }
    emit(state.copyOf(cartItems: cartBooks));
  }
}
