import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybooks/localizations.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/ui/kit/mb_colors.dart';
import 'package:rxdart/rxdart.dart';

const _tag = 'mb_page_state_mixin';

mixin MBPageStateMixin<T extends StatefulWidget> on State<T> {
  late MBColors _colors;
  late AppLocalizations _localizations;

  @protected
  MBColors get colors => _colors;

  @protected
  AppLocalizations get localizations => _localizations;

  CompositeSubscription? _subscriptions;

  @override
  void dispose() {
    _subscriptions?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colors = MBColors.of(context);
    final localization = AppLocalizations.of(context);
    if (localization == null) {
      Log.d(_tag, "Can't load localization. Use default");
      AppLocalizations.load(const Locale('en')).then(
        (it) => _localizations = it,
      );
    } else {
      _localizations = localization;
    }
  }

  void collectStreamSubscription(StreamSubscription subscription) {
    final subscriptions = _subscriptions ?? CompositeSubscription();
    subscriptions.add(subscription);
    _subscriptions = subscriptions;
  }
}
