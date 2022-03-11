import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mybooks/data/models/server/book.dart';
import 'package:mybooks/data/models/states/books_page_state.dart';
import 'package:mybooks/domain/books_page_page_bloc.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';
import 'package:mybooks/ui/mb_page_mixin.dart';
import 'package:provider/provider.dart';

const _tag = 'books_page';

class BooksPage extends StatefulWidget {
  const BooksPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/books';

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> with MBPageStateMixin {
  late final BooksPageBloc _bloc;
  late BooksPageState _state;

  @override
  void initState() {
    super.initState();
    _bloc = BooksPageBloc(
      bookRepository: context.read(),
    );
    final blocSubscription = _bloc.stateStream.listen((state) {
      setState(() {
        _state = state;
      });
    });
    collectStreamSubscription(blocSubscription);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: _body(),
      appBar: _appBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        localizations.books,
        style: MBTextStyle.instance.style18.copyWith(
          color: colors.primaryTextColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _body() {
    return FutureBuilder<Object>(
      future: _bloc.stateStream.first,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(color: colors.backgroundColor);

        return _content();
      },
    );
  }

  Widget _content() {
    if (_state.loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: _state.books.length,
      );
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final book = _state.books[index];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(book),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _title(book),
            ],
          ),
        ),
      ],
    );
  }

  Widget _image(Book book) {
    Log.d(_tag, "coverImageUrl = ${book.coverImageUrl}");
    return CachedNetworkImage(
      width: 200,
      height: 200,
      imageUrl: book.coverImageUrl,
      errorWidget: (
        BuildContext context,
        String url,
        dynamic error,
      ) =>
          Container(),
    );
  }

  Widget _title(Book book) {
    return Text(
      "${book.title}",
      style: MBTextStyle.instance.style14Semibold
          .copyWith(color: colors.primaryTextColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Container();
  }
}
