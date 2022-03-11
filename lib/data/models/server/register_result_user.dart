import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_result_user.g.dart';

abstract class RegisterResultUser
    implements Built<RegisterResultUser, RegisterResultUserBuilder> {
  factory RegisterResultUser(
          [void Function(RegisterResultUserBuilder) updates]) =
      _$RegisterResultUser;

  RegisterResultUser._();

  static Serializer<RegisterResultUser> get serializer =>
      _$registerResultUserSerializer;

  String get id;

  String get username;

  String get token;
}
