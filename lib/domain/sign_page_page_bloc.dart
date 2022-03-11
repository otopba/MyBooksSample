import 'dart:async';

import 'package:mybooks/data/models/server/register_result.dart';
import 'package:mybooks/data/models/states/sign_page_state.dart';
import 'package:mybooks/localizations.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/services/api_service.dart';
import 'package:mybooks/services/preferences_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mybooks/utils/texts.dart';

const _tag = 'sign_page_page_bloc';

enum SignType { login, register }

class SignPageBloc {
  SignPageBloc({
    required this.signType,
    required this.api,
    required this.prefs,
  }) {
    _init();
  }

  final _state = BehaviorSubject<SignPageState>();
  final SignType signType;
  final ApiService api;
  final PreferencesService prefs;

  String? _username;
  String? _password;

  Stream<SignPageState> get stateStream => _state;

  Future<void> _init() async {
    final initState = SignPageState((b) => b..loading = false);
    _state.add(initState);
  }

  Future<void> dispose() async {
    await _state.close();
  }

  void _updateState(
    void Function(SignPageStateBuilder b) updates,
  ) {
    if (_state.isClosed) return;

    final newState = _state.value.rebuild(updates);
    _state.add(newState);
  }

  void setUsername(String value) {
    _username = value;
    if (_state.value.usernameError.isNullOrEmpty) return;

    final username = _username?.trim();
    if (username.isNotNullOrEmpty) {
      _updateState((b) => b..usernameError = null);
    }
  }

  void setPassword(String value) {
    _password = value;
    if (_state.value.passwordError.isNullOrEmpty) return;

    final password = _password?.trim();
    if (password.isNotNullOrEmpty) {
      _updateState((b) => b..passwordError = null);
    }
  }

  Future<bool> process(AppLocalizations appLocalizations) async {
    if (_state.value.loading) return false;

    final username = _username?.trim();
    final password = _password?.trim();

    String? usernameError;
    if (username.isNullOrEmpty) {
      usernameError = appLocalizations.cantBeEmpty;
    }

    String? passwordError;
    if (password.isNullOrEmpty) {
      passwordError = appLocalizations.cantBeEmpty;
    }

    if (usernameError.isNotNullOrEmpty || passwordError.isNotNullOrEmpty) {
      _updateState(
        (b) => b
          ..usernameError = usernameError
          ..passwordError = passwordError,
      );
      return false;
    }

    _updateState(
      (b) => b
        ..loading = true
        ..processError = null,
    );

    final Future request;
    if (signType == SignType.register) {
      request = api.register(username: username!, password: password!);
    } else {
      request = api.login(username: username!, password: password!);
    }

    return request
        .then(
          (result) async => _processSuccess(
            result: result,
            appLocalizations: appLocalizations,
          ),
        )
        .catchError(
          (error, stackTrace) => _processError(
            error: error,
            stackTrace: stackTrace,
            appLocalizations: appLocalizations,
          ),
        );
  }

  Future<bool> _processSuccess({
    required RegisterResult result,
    required AppLocalizations appLocalizations,
  }) async {
    if (result.user.token.isNullOrEmpty) {
      Log.e(_tag, "Token is isNullOrEmpty");
      _updateState(
        (b) => b
          ..processError = appLocalizations.tryAgainLater
          ..loading = false,
      );
      return false;
    } else {
      Log.d(_tag, "Save token");
      await prefs.setToken(result.user.token);
      _updateState(
        (b) => b
          ..processError = null
          ..loading = false,
      );
      return true;
    }
  }

  bool _processError({
    dynamic error,
    StackTrace? stackTrace,
    required AppLocalizations appLocalizations,
  }) {
    if (error is String) {
      _updateState(
        (b) => b
          ..processError = error.isNullOrEmpty
              ? appLocalizations.tryAgainLater
              : error.toUpperCaseFirstLetter()
          ..loading = false,
      );
    } else {
      Log.e(_tag, 'Unknown error: $error', stackTrace: stackTrace);
      _updateState(
        (b) => b
          ..processError = appLocalizations.tryAgainLater
          ..loading = false,
      );
    }

    return false;
  }
}
