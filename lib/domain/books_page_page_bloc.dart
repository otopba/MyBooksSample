import 'dart:async';

import 'package:mybooks/data/models/server/book.dart';
import 'package:mybooks/data/models/states/books_page_state.dart';
import 'package:mybooks/data/repositories/book_repository.dart';
import 'package:mybooks/log.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';

const _tag = 'books_page_page_bloc';

class BooksPageBloc {
  BooksPageBloc({
    required this.bookRepository,
  }) {
    _init();
  }

  final _state = BehaviorSubject<BooksPageState>();
  final BookRepository bookRepository;

  String? _query;

  Stream<BooksPageState> get stateStream => _state;

  Future<void> _init() async {
    final initState = BooksPageState(
      (b) => b
        ..loading = true
        ..books = BuiltList<Book>().toBuilder(),
    );
    _state.add(initState);

    _loadBooks();
  }

  Future<void> dispose() async {
    await _state.close();
  }

  void _updateState(
    void Function(BooksPageStateBuilder b) updates,
  ) {
    if (_state.isClosed) return;

    final newState = _state.value.rebuild(updates);
    _state.add(newState);
  }

  void setQuery(String query) {
    _query = query;
  }

  void _loadBooks() {
    bookRepository.getBooks(_query).then((books) {
      Log.d(_tag, 'Loaded ${books.length}');
      _updateState(
        (b) => b
          ..loading = false
          ..books = books.toBuilder(),
      );
    }).catchError((error, stackTrace) {
      _updateState(
        (b) => b
          ..loading = false
          ..books = BuiltList<Book>().toBuilder(),
      );
    });
  }
}
