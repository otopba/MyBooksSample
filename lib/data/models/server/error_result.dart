import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mybooks/data/models/server/register_result_user.dart';

part 'error_result.g.dart';

abstract class ErrorResult implements Built<ErrorResult, ErrorResultBuilder> {
  factory ErrorResult([void Function(ErrorResultBuilder) updates]) =
      _$ErrorResult;

  ErrorResult._();

  static Serializer<ErrorResult> get serializer => _$errorResultSerializer;

  String get message;
}
