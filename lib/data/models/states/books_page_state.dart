import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mybooks/data/models/server/book.dart';

part 'books_page_state.g.dart';

abstract class BooksPageState
    implements Built<BooksPageState, BooksPageStateBuilder> {
  factory BooksPageState([void Function(BooksPageStateBuilder) updates]) =
      _$BooksPageState;

  BooksPageState._();

  bool get loading;

  BuiltList<Book> get books;
}
