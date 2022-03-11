// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorResult> _$errorResultSerializer = new _$ErrorResultSerializer();

class _$ErrorResultSerializer implements StructuredSerializer<ErrorResult> {
  @override
  final Iterable<Type> types = const [ErrorResult, _$ErrorResult];
  @override
  final String wireName = 'ErrorResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, ErrorResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ErrorResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorResult extends ErrorResult {
  @override
  final String message;

  factory _$ErrorResult([void Function(ErrorResultBuilder)? updates]) =>
      (new ErrorResultBuilder()..update(updates)).build();

  _$ErrorResult._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'ErrorResult', 'message');
  }

  @override
  ErrorResult rebuild(void Function(ErrorResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorResultBuilder toBuilder() => new ErrorResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorResult && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorResult')..add('message', message))
        .toString();
  }
}

class ErrorResultBuilder implements Builder<ErrorResult, ErrorResultBuilder> {
  _$ErrorResult? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ErrorResultBuilder();

  ErrorResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorResult;
  }

  @override
  void update(void Function(ErrorResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorResult build() {
    final _$result = _$v ??
        new _$ErrorResult._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ErrorResult', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
