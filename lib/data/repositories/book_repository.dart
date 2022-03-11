import 'dart:async';

import 'package:mybooks/data/models/server/book.dart';
import 'package:mybooks/services/api_service.dart';
import 'package:built_collection/built_collection.dart';

const _tag = 'book_repository';

// TODO: add persistable cache
class CachedQuery {
  final _completer = Completer<BuiltList<Book>>();

  Future<BuiltList<Book>> get future => _completer.future;

  CachedQuery(Future<BuiltList<Book>> future) {
    future
        .then((value) => _completer.complete(value))
        .catchError(_completer.completeError);
  }
}

class BookRepository {
  final ApiService api;
  final _cache = <String, CachedQuery>{};

  BookRepository({
    required this.api,
  });

  Future<BuiltList<Book>> getBooks(String? rawQuery) {
    final query = rawQuery?.trim().toLowerCase() ?? "";

    final oldCached = _cache[query];
    if (oldCached != null) {
      return oldCached.future;
    }

    final future = api.books(query: query).then((value) => value.books);
    final newCached = CachedQuery(future);
    _cache[query] = newCached;
    return newCached.future;
  }
}
