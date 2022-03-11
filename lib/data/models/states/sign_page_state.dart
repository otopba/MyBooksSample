import 'package:built_value/built_value.dart';

part 'sign_page_state.g.dart';

abstract class SignPageState
    implements Built<SignPageState, SignPageStateBuilder> {
  factory SignPageState([void Function(SignPageStateBuilder) updates]) =
      _$SignPageState;

  SignPageState._();

  bool get loading;

  String? get processError;

  String? get usernameError;

  String? get passwordError;
}
