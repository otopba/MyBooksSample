import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mybooks/ui/kit/mb_text_style_android.dart';
import 'package:mybooks/ui/kit/mb_text_style_ios.dart';

abstract class MBTextStyle {
  static const sFProDisplay = 'SFProDisplay';
  static const sFProText = 'SFProText';
  static const roboto = 'Roboto';

  static MBTextStyle instance = defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS
      ? MBTextStyleIOs()
      : MBTextStyleAndroid();

  TextStyle get styleH2;

  TextStyle get style20;

  TextStyle get style18;

  TextStyle get style17;

  TextStyle get style17Semibold;

  TextStyle get style14Semibold;

  TextStyle get style12;
}
