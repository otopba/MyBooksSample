// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Book> _$bookSerializer = new _$BookSerializer();

class _$BookSerializer implements StructuredSerializer<Book> {
  @override
  final Iterable<Type> types = const [Book, _$Book];
  @override
  final String wireName = 'Book';

  @override
  Iterable<Object?> serialize(Serializers serializers, Book object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'coverImageUrl',
      serializers.serialize(object.coverImageUrl,
          specifiedType: const FullType(String)),
      'pageCount',
      serializers.serialize(object.pageCount,
          specifiedType: const FullType(int)),
      'publisher',
      serializers.serialize(object.publisher,
          specifiedType: const FullType(String)),
      'synopsis',
      serializers.serialize(object.synopsis,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  Book deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'coverImageUrl':
          result.coverImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pageCount':
          result.pageCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'publisher':
          result.publisher = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'synopsis':
          result.synopsis = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Book extends Book {
  @override
  final String id;
  @override
  final JsonObject? title;
  @override
  final String author;
  @override
  final String coverImageUrl;
  @override
  final int pageCount;
  @override
  final String publisher;
  @override
  final String synopsis;

  factory _$Book([void Function(BookBuilder)? updates]) =>
      (new BookBuilder()..update(updates)).build();

  _$Book._(
      {required this.id,
      this.title,
      required this.author,
      required this.coverImageUrl,
      required this.pageCount,
      required this.publisher,
      required this.synopsis})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Book', 'id');
    BuiltValueNullFieldError.checkNotNull(author, 'Book', 'author');
    BuiltValueNullFieldError.checkNotNull(
        coverImageUrl, 'Book', 'coverImageUrl');
    BuiltValueNullFieldError.checkNotNull(pageCount, 'Book', 'pageCount');
    BuiltValueNullFieldError.checkNotNull(publisher, 'Book', 'publisher');
    BuiltValueNullFieldError.checkNotNull(synopsis, 'Book', 'synopsis');
  }

  @override
  Book rebuild(void Function(BookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookBuilder toBuilder() => new BookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Book &&
        id == other.id &&
        title == other.title &&
        author == other.author &&
        coverImageUrl == other.coverImageUrl &&
        pageCount == other.pageCount &&
        publisher == other.publisher &&
        synopsis == other.synopsis;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), title.hashCode),
                        author.hashCode),
                    coverImageUrl.hashCode),
                pageCount.hashCode),
            publisher.hashCode),
        synopsis.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Book')
          ..add('id', id)
          ..add('title', title)
          ..add('author', author)
          ..add('coverImageUrl', coverImageUrl)
          ..add('pageCount', pageCount)
          ..add('publisher', publisher)
          ..add('synopsis', synopsis))
        .toString();
  }
}

class BookBuilder implements Builder<Book, BookBuilder> {
  _$Book? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  JsonObject? _title;
  JsonObject? get title => _$this._title;
  set title(JsonObject? title) => _$this._title = title;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _coverImageUrl;
  String? get coverImageUrl => _$this._coverImageUrl;
  set coverImageUrl(String? coverImageUrl) =>
      _$this._coverImageUrl = coverImageUrl;

  int? _pageCount;
  int? get pageCount => _$this._pageCount;
  set pageCount(int? pageCount) => _$this._pageCount = pageCount;

  String? _publisher;
  String? get publisher => _$this._publisher;
  set publisher(String? publisher) => _$this._publisher = publisher;

  String? _synopsis;
  String? get synopsis => _$this._synopsis;
  set synopsis(String? synopsis) => _$this._synopsis = synopsis;

  BookBuilder();

  BookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _author = $v.author;
      _coverImageUrl = $v.coverImageUrl;
      _pageCount = $v.pageCount;
      _publisher = $v.publisher;
      _synopsis = $v.synopsis;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Book other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Book;
  }

  @override
  void update(void Function(BookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Book build() {
    final _$result = _$v ??
        new _$Book._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Book', 'id'),
            title: title,
            author:
                BuiltValueNullFieldError.checkNotNull(author, 'Book', 'author'),
            coverImageUrl: BuiltValueNullFieldError.checkNotNull(
                coverImageUrl, 'Book', 'coverImageUrl'),
            pageCount: BuiltValueNullFieldError.checkNotNull(
                pageCount, 'Book', 'pageCount'),
            publisher: BuiltValueNullFieldError.checkNotNull(
                publisher, 'Book', 'publisher'),
            synopsis: BuiltValueNullFieldError.checkNotNull(
                synopsis, 'Book', 'synopsis'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
