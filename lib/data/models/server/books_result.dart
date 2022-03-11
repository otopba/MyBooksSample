import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mybooks/data/models/server/book.dart';

part 'books_result.g.dart';

abstract class BooksResult implements Built<BooksResult, BooksResultBuilder> {
  factory BooksResult([void Function(BooksResultBuilder) updates]) = _$BooksResult;

  BooksResult._();

  static Serializer<BooksResult> get serializer => _$booksResultSerializer;

  BuiltList<Book> get books;
}
