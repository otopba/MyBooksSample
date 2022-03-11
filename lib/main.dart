import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybooks/app.dart';
import 'package:mybooks/log.dart';
import 'package:mybooks/services/preferences_service.dart';

const _tag = 'main';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.instance.init();

  runZonedGuarded<Future<void>>(
    () async => runApp(App()),
    (Object error, StackTrace stackTrace) =>
        Log.e(_tag, error, stackTrace: stackTrace),
  );
}
