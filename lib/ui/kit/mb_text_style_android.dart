import 'package:flutter/cupertino.dart';
import 'package:mybooks/ui/kit/mb_text_style.dart';

class MBTextStyleAndroid implements MBTextStyle {
  @override
  TextStyle styleH2 = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 40,
    height: 1.0,
  );

  @override
  TextStyle style20 = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.2,
    letterSpacing: 0.15,
  );

  @override
  TextStyle style18 = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.33,
    letterSpacing: 0.13,
  );

  @override
  TextStyle style17 = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.normal,
    fontSize: 17,
    height: 1.35,
    letterSpacing: 0.15,
  );

  @override
  TextStyle style17Semibold = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 1.35,
    letterSpacing: 0.15,
  );

  @override
  TextStyle style14Semibold = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.43,
    letterSpacing: 0.1,
  );
  @override
  TextStyle style12 = const TextStyle(
    fontFamily: MBTextStyle.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 2.0,
    letterSpacing: 0.2,
  );
}
