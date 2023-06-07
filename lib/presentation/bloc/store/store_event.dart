import '../../../domain/models/book.dart';

abstract class StoreEvent {
  const StoreEvent();
}

class StoreGetAllBooksEvent extends StoreEvent{}
