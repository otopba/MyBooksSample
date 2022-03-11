import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

typedef LocalizedString = String Function(AppLocalizations appLocalizations);

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle {
    return Intl.message('MyBooks', name: 'appTitle');
  }

  String get login {
    return Intl.message('Login', name: 'login');
  }

  String get register {
    return Intl.message('Register', name: 'register');
  }

  String get username {
    return Intl.message('Username', name: 'username');
  }

  String get password {
    return Intl.message('Password', name: 'password');
  }

  String get cantBeEmpty {
    return Intl.message("Can't be empty", name: 'cantBeEmpty');
  }

  String get tryAgainLater {
    return Intl.message("Error. Try again later", name: 'tryAgainLater');
  }

  String get books {
    return Intl.message("Books", name: 'books');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
