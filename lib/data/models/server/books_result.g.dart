// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BooksResult> _$booksResultSerializer = new _$BooksResultSerializer();

class _$BooksResultSerializer implements StructuredSerializer<BooksResult> {
  @override
  final Iterable<Type> types = const [BooksResult, _$BooksResult];
  @override
  final String wireName = 'BooksResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, BooksResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'books',
      serializers.serialize(object.books,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Book)])),
    ];

    return result;
  }

  @override
  BooksResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BooksResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'books':
          result.books.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Book)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$BooksResult extends BooksResult {
  @override
  final BuiltList<Book> books;

  factory _$BooksResult([void Function(BooksResultBuilder)? updates]) =>
      (new BooksResultBuilder()..update(updates)).build();

  _$BooksResult._({required this.books}) : super._() {
    BuiltValueNullFieldError.checkNotNull(books, 'BooksResult', 'books');
  }

  @override
  BooksResult rebuild(void Function(BooksResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BooksResultBuilder toBuilder() => new BooksResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooksResult && books == other.books;
  }

  @override
  int get hashCode {
    return $jf($jc(0, books.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BooksResult')..add('books', books))
        .toString();
  }
}

class BooksResultBuilder implements Builder<BooksResult, BooksResultBuilder> {
  _$BooksResult? _$v;

  ListBuilder<Book>? _books;
  ListBuilder<Book> get books => _$this._books ??= new ListBuilder<Book>();
  set books(ListBuilder<Book>? books) => _$this._books = books;

  BooksResultBuilder();

  BooksResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _books = $v.books.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BooksResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooksResult;
  }

  @override
  void update(void Function(BooksResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BooksResult build() {
    _$BooksResult _$result;
    try {
      _$result = _$v ?? new _$BooksResult._(books: books.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'books';
        books.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BooksResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
