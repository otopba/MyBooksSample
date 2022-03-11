import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'book.g.dart';

abstract class Book implements Built<Book, BookBuilder> {
  factory Book([void Function(BookBuilder) updates]) = _$Book;

  Book._();

  static Serializer<Book> get serializer => _$bookSerializer;

  String get id;

  //because can be string or int
  JsonObject? get title;

  String get author;

  String get coverImageUrl;

  int get pageCount;

  String get publisher;

  String get synopsis;
}
