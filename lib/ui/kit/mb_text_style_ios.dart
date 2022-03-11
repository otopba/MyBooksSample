import 'package:flutter/cupertino.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';

class MBTextStyleIOs implements MBTextStyle {
  @override
  TextStyle styleH2 = const TextStyle(
    fontFamily: MBTextStyle.sFProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 40,
    height: 1.0,
    letterSpacing: 0.4,
  );

  @override
  TextStyle style20 = const TextStyle(
    fontFamily: MBTextStyle.sFProDisplay,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.3,
    letterSpacing: 0.38,
  );

  @override
  TextStyle style18 = const TextStyle(
    fontFamily: MBTextStyle.sFProText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.44,
    letterSpacing: -0.55,
  );

  @override
  TextStyle style17 = const TextStyle(
    fontFamily: MBTextStyle.sFProText,
    fontWeight: FontWeight.normal,
    fontSize: 17,
    height: 1.29,
    letterSpacing: -0.408,
  );

  @override
  TextStyle style17Semibold = const TextStyle(
    fontFamily: MBTextStyle.sFProText,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 1.1,
    letterSpacing: -0.408,
  );

  @override
  TextStyle style14Semibold = const TextStyle(
    fontFamily: MBTextStyle.sFProText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    letterSpacing: -0.154,
    height: 1.0,
  );

  @override
  TextStyle style12 = const TextStyle(
    fontFamily: MBTextStyle.sFProText,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );
}
