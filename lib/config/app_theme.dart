import 'package:flutter/material.dart';

class AppTheme {
  static const backgroundColor = Color(0xFF202123); //Color(0xFFf1f7fd);
  static const backgroundColorLight = Color(0xFFf1f7fd);
  static const primaryTextColor = Color(0xFFbdc4d2);

  static ThemeData of(context) {
    var theme = Theme.of(context);
    return _setTheme(theme, backgroundColorLight, primaryTextColor);
  }

  static ThemeData dark(context) {
    var theme = Theme.of(context);
    return _setTheme(theme, backgroundColor, primaryTextColor);
  }

  static ThemeData _setTheme(ThemeData theme, Color bgColor, Color textColor) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        background: bgColor
      ),
      scaffoldBackgroundColor: bgColor,
      textTheme: theme.textTheme.copyWith(
        headline4: theme.textTheme.headline4!.copyWith(color: textColor),
        headline5: theme.textTheme.headline5!.copyWith(color: textColor),
        headline6: theme.textTheme.headline6!.copyWith(color: textColor),
        bodyText1: theme.textTheme.bodyText1!.copyWith(color: textColor),
        bodyText2: theme.textTheme.bodyText2!.copyWith(color: textColor),
        caption: theme.textTheme.caption!.copyWith(color: textColor),
      ),
    );
  }
}
