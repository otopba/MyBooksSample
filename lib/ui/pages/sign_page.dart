import 'package:flutter/material.dart';
import 'package:mybooks/data/models/states/sign_page_state.dart';
import 'package:mybooks/domain/sign_page_page_bloc.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/ui/kit/mb_button.dart';
import 'package:mybooks/ui/kit/mb_colors.dart';
import 'package:mybooks/ui/kit/mb_field.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';
import 'package:mybooks/ui/mb_page_mixin.dart';
import 'package:mybooks/ui/pages/books_page.dart';
import 'package:provider/provider.dart';

const _tag = 'sign_page';

class LoginPageArguments {
  final SignType signType;

  LoginPageArguments({required this.signType});
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const routeName = '/login';

  final LoginPageArguments arguments;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MBPageStateMixin {
  late final SignPageBloc _bloc;
  late SignPageState _state;

  @override
  void initState() {
    super.initState();
    _bloc = SignPageBloc(
      signType: widget.arguments.signType,
      api: context.read(),
      prefs: context.read(),
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _processError(),
          const SizedBox(height: 50),
          _usernameField(),
          const SizedBox(height: 10),
          _passwordField(),
          const SizedBox(height: 50),
          _processButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      _titleText(),
      textAlign: TextAlign.center,
      style: MBTextStyle.instance.styleH2.copyWith(
        color: colors.primaryTextColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _processError() {
    return Text(
      _state.processError ?? "",
      textAlign: TextAlign.center,
      style: MBTextStyle.instance.style20.copyWith(
        color: MBColors.redColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _titleText() {
    if (widget.arguments.signType == SignType.register) {
      return localizations.register;
    } else {
      return localizations.login;
    }
  }

  Widget _usernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MBField(
        labelText: localizations.username,
        onChanged: _onUsernameChanged,
        textInputAction: TextInputAction.next,
        errorText: _state.usernameError,
        enabled: !_state.loading,
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MBField(
        labelText: localizations.password,
        onChanged: _onPasswordChanged,
        textInputAction: TextInputAction.done,
        onDone: _onDone,
        errorText: _state.passwordError,
        enabled: !_state.loading,
      ),
    );
  }

  Widget _processButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: MBButton.primary(
          text: _titleText(),
          onPressed: _onProcessButtonPressed,
          loading: _state.loading,
        ),
      ),
    );
  }

  void _onProcessButtonPressed() {
    Log.d(_tag, "On process button pressed");

    _process();
  }

  void _onUsernameChanged(String value) {
    if (_state.loading) return;

    _bloc.setUsername(value);
  }

  void _onPasswordChanged(String value) {
    if (_state.loading) return;

    _bloc.setPassword(value);
  }

  void _onDone() {
    Log.d(_tag, 'On done');

    _process();
  }

  Future<void> _process() async {
    if (_state.loading) return;

    final result = await _bloc.process(localizations);
    Log.d(_tag, '_process: result = $result');
    if (result) {
      Log.d(_tag, '_process: push books page');
      Navigator.pushReplacementNamed(context, BooksPage.routeName);
    }
  }
}
