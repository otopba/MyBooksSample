import 'package:flutter/material.dart';

class MBColors {
  MBColors._(bool darkMode)
      : backgroundColor = darkMode ? blackColor : whiteColor,
        primaryTextColor = darkMode ? whiteColor : blackColor,
        secondaryTextColor = darkMode ? whiteOp50Color : blackOp40Color,
        switchTrackColor = darkMode ? whiteOp20Color : whiteOp20Color,
        switchThumbColor = darkMode ? purpleColor : purpleColor,
        listRowBackgroundColor =
            darkMode ? whiteColor.withOpacity(0.02) : strokeColor,
        thumbColor = darkMode ? mainColor : blackColor,
        inactiveTrackColor = darkMode ? bgDarkColor : strokeColor,
        likeBorderColor =
            darkMode ? strokeColor.withOpacity(0.15) : strokeColor,
        appDeprecatedCircleColor = darkMode ? whiteOp5Color : strokeColor,
        listItemBackgroundColor = darkMode ? bgDarkColor : strokeColor,
        wordCardBackgroundColor = darkMode ? bgDarkColor : whiteColor,
        feedBackgroundColor = darkMode ? blackColor : bgGrayColor,
        switchBackgroundColor =
            darkMode ? whiteColor.withOpacity(0.28) : strokeColor,
        speakColor = darkMode ? greenColor : const Color(0xFF72D494),
        highlightTextColor = darkMode ? Colors.white : Colors.black,
        popupMenuSeparator = darkMode
            ? const Color(0xFF545458).withOpacity(0.65)
            : const Color(0xFF3C3C43).withOpacity(0.36),
        menuIconColor = darkMode ? MBColors.greenColor : greenForWhiteColor,
        menuDevIconColor = darkMode ? mainColor : blackColor,
        menuDevTextColor = darkMode ? mainColor : blackOp40Color,
        writeUsDotOutsideColor =
            darkMode ? mainColor.withOpacity(0.2) : blackColor.withOpacity(0.1),
        writeUsDotInsideColor = darkMode ? mainColor : blackColor,
        learnTokensFrontCardColor = darkMode ? whiteColor : blackColor,
        learnTokensFrontLanguageColor =
            darkMode ? blackOp40Color : whiteColor.withOpacity(0.4),
        learnTokensFrontTextColor = darkMode ? blackColor : whiteColor,
        learnTokensFrontTTSColor = darkMode ? strokeColor : bgDarkColor,
        learnTokensBackLanguageColor =
            darkMode ? whiteColor.withOpacity(0.4) : bgDarkColor,
        learnTokensBackCardColor = darkMode ? bgDarkColor : strokeColor,
        learnTokensBackTextColor = darkMode ? whiteColor : blackColor,
        learnTokensBackTTSColor =
            darkMode ? whiteColor.withOpacity(0.02) : whiteColor;

  static const orangeColor = Color(0xFFFFBE99);
  static const pinkColor = Color(0xFFF47FB9);
  static const purpleColor = Color(0xFF6955D4);
  static const redSaleColor = Color(0xFFFF8A8A);
  static const redColor = Color(0xFFFE524E);
  static final redOp10Color = redColor.withOpacity(0.1);
  static const blackColor = Color(0xFF000000);
  static final blackOp90Color = blackColor.withOpacity(0.9);
  static final blackOp40Color = blackColor.withOpacity(0.4);
  static const bgDarkColor = Color(0xFF191919);
  static const bgGrayColor = Color(0xFFE8E8E8);
  static const mainColor = Color(0xFFFFE999);
  static final mainColorOp80Color = mainColor.withOpacity(0.8);
  static const whiteColor = Color(0xFFFFFFFF);
  static final whiteOp50Color = whiteColor.withOpacity(0.5);
  static final whiteOp20Color = whiteColor.withOpacity(0.2);
  static final whiteOp5Color = whiteColor.withOpacity(0.05);
  static const strokeColor = Color(0xFFF4F4F4);
  static const greenColor = Color(0xFF91F4B3);
  static const greenForWhiteColor = Color(0xFF7CE7A1);
  static const green2Color = Color(0xFF00C46C);
  static const cupertinoMenuColor = Color(0xFF007AFF);

  final Color accentColor = mainColor;
  final Color backgroundColor;
  final Color highlightColor = const Color(0xFFC7C7C7).withOpacity(0.15);
  final Color splashColor = const Color(0xFFC7C7C7).withOpacity(0.2);
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color switchTrackColor;
  final Color switchThumbColor;
  final Color listRowBackgroundColor;
  final Color thumbColor;
  final Color inactiveTrackColor;
  final Color likeBorderColor;
  final Color appDeprecatedCircleColor;
  final Color listItemBackgroundColor;
  final Color wordCardBackgroundColor;
  final Color feedBackgroundColor;
  final Color switchBackgroundColor;
  final Color speakColor;
  final Color highlightTextColor;
  final Color popupMenuSeparator;
  final Color menuIconColor;
  final Color menuDevIconColor;
  final Color menuDevTextColor;
  final Color writeUsDotOutsideColor;
  final Color writeUsDotInsideColor;
  final Color learnTokensFrontCardColor;
  final Color learnTokensFrontLanguageColor;
  final Color learnTokensFrontTextColor;
  final Color learnTokensFrontTTSColor;
  final Color learnTokensBackLanguageColor;
  final Color learnTokensBackCardColor;
  final Color learnTokensBackTextColor;
  final Color learnTokensBackTTSColor;

  static final MBColors lightColors = MBColors._(false);
  static final MBColors darkColors = MBColors._(true);

  static MBColors of(BuildContext context) {
    return isLightTheme(context) ? lightColors : darkColors;
  }

  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}
