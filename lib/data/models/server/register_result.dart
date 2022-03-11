import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mybooks/data/models/server/register_result_user.dart';

part 'register_result.g.dart';

abstract class RegisterResult
    implements Built<RegisterResult, RegisterResultBuilder> {
  factory RegisterResult([void Function(RegisterResultBuilder) updates]) =
      _$RegisterResult;

  RegisterResult._();

  static Serializer<RegisterResult> get serializer =>
      _$registerResultSerializer;

  RegisterResultUser get user;
}
