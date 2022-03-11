import 'dart:core';

import 'package:mybooks/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _tag = 'preferences_service';

class PreferencesService {
  PreferencesService._();

  static final PreferencesService instance = PreferencesService._();
  static const _firstStartKey = 'FIRST_START';
  static const _tokenKey = 'TOKEN';

  late final SharedPreferences _prefs;
  late final bool _isFirstStart;

  Future<void> init() async {
    Log.d(_tag, 'init');

    _prefs = await SharedPreferences.getInstance();

    _isFirstStart = _prefs.getBool(_firstStartKey) ?? true;
    if (_isFirstStart) {
      await clear();
    }
    await _prefs.setBool(_firstStartKey, false);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }

  Future<bool> setToken(String? token) {
    return _prefs.setStringSafe(_tokenKey, token);
  }

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }
}

extension SharedPreferencesEx on SharedPreferences {
  Future<bool> setBoolSafe(String key, bool? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setBool(key, value);
    }
  }

  Future<bool> setDoubleSafe(String key, double? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setDouble(key, value);
    }
  }

  Future<bool> setIntSafe(String key, int? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setInt(key, value);
    }
  }

  Future<bool> setStringSafe(String key, String? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setString(key, value);
    }
  }

  Future<bool> setStringListSafe(String key, List<String>? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setStringList(key, value);
    }
  }
}
