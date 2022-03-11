// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_result_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterResultUser> _$registerResultUserSerializer =
    new _$RegisterResultUserSerializer();

class _$RegisterResultUserSerializer
    implements StructuredSerializer<RegisterResultUser> {
  @override
  final Iterable<Type> types = const [RegisterResultUser, _$RegisterResultUser];
  @override
  final String wireName = 'RegisterResultUser';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RegisterResultUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RegisterResultUser deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterResultUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterResultUser extends RegisterResultUser {
  @override
  final String id;
  @override
  final String username;
  @override
  final String token;

  factory _$RegisterResultUser(
          [void Function(RegisterResultUserBuilder)? updates]) =>
      (new RegisterResultUserBuilder()..update(updates)).build();

  _$RegisterResultUser._(
      {required this.id, required this.username, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'RegisterResultUser', 'id');
    BuiltValueNullFieldError.checkNotNull(
        username, 'RegisterResultUser', 'username');
    BuiltValueNullFieldError.checkNotNull(token, 'RegisterResultUser', 'token');
  }

  @override
  RegisterResultUser rebuild(
          void Function(RegisterResultUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterResultUserBuilder toBuilder() =>
      new RegisterResultUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterResultUser &&
        id == other.id &&
        username == other.username &&
        token == other.token;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), username.hashCode), token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterResultUser')
          ..add('id', id)
          ..add('username', username)
          ..add('token', token))
        .toString();
  }
}

class RegisterResultUserBuilder
    implements Builder<RegisterResultUser, RegisterResultUserBuilder> {
  _$RegisterResultUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  RegisterResultUserBuilder();

  RegisterResultUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterResultUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterResultUser;
  }

  @override
  void update(void Function(RegisterResultUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterResultUser build() {
    final _$result = _$v ??
        new _$RegisterResultUser._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'RegisterResultUser', 'id'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'RegisterResultUser', 'username'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, 'RegisterResultUser', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
