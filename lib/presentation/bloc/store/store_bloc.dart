import 'dart:async';

import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/bloc/store/store_event.dart';
import 'package:binderbee/presentation/bloc/store/store_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc(this._bookRepository) : super(const StoreState()) {
    on<StoreGetAllBooksEvent>(_onGetAllBooks);
  }

  final BookRepository _bookRepository;

  Future<void> _onGetAllBooks(StoreGetAllBooksEvent event, Emitter<StoreState> emit) async {
    try{
      emit(state.copyWith(booksStatus: StoreRequest.inProgress));
      final books = await _bookRepository.getAllBooks();

      emit(state.copyWith(booksStatus: StoreRequest.successRequest, books: books));
    } on DioError catch (e){
      emit(state.copyWith(
        booksStatus: StoreRequest.failureRequest,
      ));
    }
  }
}
