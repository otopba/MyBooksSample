import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:mybooks/data/models/server/book.dart';
import 'package:mybooks/data/models/server/books_result.dart';
import 'package:mybooks/data/models/server/error_result.dart';
import 'package:mybooks/data/models/server/register_result.dart';
import 'package:mybooks/data/models/server/register_result_user.dart';

part 'serializers.g.dart';

@SerializersFor([
  RegisterResult,
  RegisterResultUser,
  ErrorResult,
  BooksResult,
  Book,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

T? deserialize<T>(dynamic value) => serializers.deserializeWith<T>(
      serializers.serializerForType(T)! as Serializer<T>,
      value,
    );

BuiltList<T?> deserializeListOf<T>(Iterable value) => BuiltList.from(
      value
          .map((dynamic value) => deserialize<T>(value))
          .toList(growable: false),
    );

Map<String, dynamic>? serialize<T>(T? value) => serializers.serializeWith(
      serializers.serializerForType(T)! as Serializer<T>,
      value,
    ) as Map<String, dynamic>?;

dynamic serializeIterable<T>(Iterable<T?> value) =>
    value.map<dynamic>((T? value) => serialize<T>(value)).toList();
