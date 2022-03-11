// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignPageState extends SignPageState {
  @override
  final bool loading;
  @override
  final String? processError;
  @override
  final String? usernameError;
  @override
  final String? passwordError;

  factory _$SignPageState([void Function(SignPageStateBuilder)? updates]) =>
      (new SignPageStateBuilder()..update(updates)).build();

  _$SignPageState._(
      {required this.loading,
      this.processError,
      this.usernameError,
      this.passwordError})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(loading, 'SignPageState', 'loading');
  }

  @override
  SignPageState rebuild(void Function(SignPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignPageStateBuilder toBuilder() => new SignPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignPageState &&
        loading == other.loading &&
        processError == other.processError &&
        usernameError == other.usernameError &&
        passwordError == other.passwordError;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, loading.hashCode), processError.hashCode),
            usernameError.hashCode),
        passwordError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignPageState')
          ..add('loading', loading)
          ..add('processError', processError)
          ..add('usernameError', usernameError)
          ..add('passwordError', passwordError))
        .toString();
  }
}

class SignPageStateBuilder
    implements Builder<SignPageState, SignPageStateBuilder> {
  _$SignPageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  String? _processError;
  String? get processError => _$this._processError;
  set processError(String? processError) => _$this._processError = processError;

  String? _usernameError;
  String? get usernameError => _$this._usernameError;
  set usernameError(String? usernameError) =>
      _$this._usernameError = usernameError;

  String? _passwordError;
  String? get passwordError => _$this._passwordError;
  set passwordError(String? passwordError) =>
      _$this._passwordError = passwordError;

  SignPageStateBuilder();

  SignPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _processError = $v.processError;
      _usernameError = $v.usernameError;
      _passwordError = $v.passwordError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignPageState;
  }

  @override
  void update(void Function(SignPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignPageState build() {
    final _$result = _$v ??
        new _$SignPageState._(
            loading: BuiltValueNullFieldError.checkNotNull(
                loading, 'SignPageState', 'loading'),
            processError: processError,
            usernameError: usernameError,
            passwordError: passwordError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
