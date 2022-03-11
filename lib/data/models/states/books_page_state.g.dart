// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BooksPageState extends BooksPageState {
  @override
  final bool loading;
  @override
  final BuiltList<Book> books;

  factory _$BooksPageState([void Function(BooksPageStateBuilder)? updates]) =>
      (new BooksPageStateBuilder()..update(updates)).build();

  _$BooksPageState._({required this.loading, required this.books}) : super._() {
    BuiltValueNullFieldError.checkNotNull(loading, 'BooksPageState', 'loading');
    BuiltValueNullFieldError.checkNotNull(books, 'BooksPageState', 'books');
  }

  @override
  BooksPageState rebuild(void Function(BooksPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BooksPageStateBuilder toBuilder() =>
      new BooksPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooksPageState &&
        loading == other.loading &&
        books == other.books;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, loading.hashCode), books.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BooksPageState')
          ..add('loading', loading)
          ..add('books', books))
        .toString();
  }
}

class BooksPageStateBuilder
    implements Builder<BooksPageState, BooksPageStateBuilder> {
  _$BooksPageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ListBuilder<Book>? _books;
  ListBuilder<Book> get books => _$this._books ??= new ListBuilder<Book>();
  set books(ListBuilder<Book>? books) => _$this._books = books;

  BooksPageStateBuilder();

  BooksPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _books = $v.books.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BooksPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooksPageState;
  }

  @override
  void update(void Function(BooksPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BooksPageState build() {
    _$BooksPageState _$result;
    try {
      _$result = _$v ??
          new _$BooksPageState._(
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, 'BooksPageState', 'loading'),
              books: books.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'books';
        books.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BooksPageState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
