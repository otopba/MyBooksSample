import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum LogType { d, w, e }

class Log {
  static const _dateFormatString = 'dd-MM-yyyy–HH:mm:ss:ms';
  static final _dateFormat = DateFormat(_dateFormatString);

  static void d(String tag, Object? message) {
    log(LogType.d, tag, message);
  }

  static void w(String tag, Object? message) {
    log(LogType.w, tag, message);
  }

  static void e(String tag, Object? message, {StackTrace? stackTrace}) {
    log(LogType.e, tag, message);
  }

  static void log(LogType type, String tag, Object? message) {
    final now = DateTime.now();
    final isolateName = Isolate.current.debugName;

    debugPrint(
      '${describeEnum(type).toUpperCase()}/${_dateFormat.format(now)} [$isolateName] $tag: $message',
    );
  }
}
