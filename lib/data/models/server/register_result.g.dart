// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterResult> _$registerResultSerializer =
    new _$RegisterResultSerializer();

class _$RegisterResultSerializer
    implements StructuredSerializer<RegisterResult> {
  @override
  final Iterable<Type> types = const [RegisterResult, _$RegisterResult];
  @override
  final String wireName = 'RegisterResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegisterResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(RegisterResultUser)),
    ];

    return result;
  }

  @override
  RegisterResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RegisterResultUser))!
              as RegisterResultUser);
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterResult extends RegisterResult {
  @override
  final RegisterResultUser user;

  factory _$RegisterResult([void Function(RegisterResultBuilder)? updates]) =>
      (new RegisterResultBuilder()..update(updates)).build();

  _$RegisterResult._({required this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(user, 'RegisterResult', 'user');
  }

  @override
  RegisterResult rebuild(void Function(RegisterResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterResultBuilder toBuilder() =>
      new RegisterResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterResult && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterResult')..add('user', user))
        .toString();
  }
}

class RegisterResultBuilder
    implements Builder<RegisterResult, RegisterResultBuilder> {
  _$RegisterResult? _$v;

  RegisterResultUserBuilder? _user;
  RegisterResultUserBuilder get user =>
      _$this._user ??= new RegisterResultUserBuilder();
  set user(RegisterResultUserBuilder? user) => _$this._user = user;

  RegisterResultBuilder();

  RegisterResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterResult;
  }

  @override
  void update(void Function(RegisterResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterResult build() {
    _$RegisterResult _$result;
    try {
      _$result = _$v ?? new _$RegisterResult._(user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RegisterResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
