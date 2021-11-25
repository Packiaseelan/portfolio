import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF766ff7);
  static const secondaryColor = Color(0xFFa1effd);
  static const darkGray = Color(0xFF979797);
  static const grey = Color(0xFFACACAC);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFDB3022);
  static const lightGray = Color(0xFF9B9B9B);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFF000000);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const black = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const disable = Color(0xFF929794);
  static const primaryTextColor = Color(0xFFFFFFFF);
  static const primaryTextColorLight = Color(0xFF595959);
  static const primaryTextColorMLight = Color(0xFFD9D9D9);
  static const logoBgColor = Color(0xFF0A0A0A);

  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: primaryColor,
      primaryColorLight: lightGray,
      bottomAppBarColor: lightGray,
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      dialogBackgroundColor: backgroundLight,
      errorColor: red,
      dividerColor: Colors.transparent,
      canvasColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
        color: black,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      textTheme: theme.textTheme.copyWith(
          // headline1: const TextStyle(
          //   color: primaryTextColor,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 32,
          // ),
          // headline2: const TextStyle(
          //   color: primaryTextColorLight,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 32,
          // ),
          // headline3: const TextStyle(
          //   color: primaryTextColorLight,
          //   fontWeight: FontWeight.w600,
          //   fontSize: 20,
          // ),
          headline4: const TextStyle(
            color: primaryTextColorLight,
          ),
          headline5: const TextStyle(
            color: primaryTextColorLight,
          ),
          headline6: const TextStyle(
            color: primaryTextColorLight,
          ),
          subtitle1: const TextStyle(
            color: primaryTextColor,
          ),
          subtitle2: const TextStyle(
            color: primaryTextColor,
          ),
          bodyText1: const TextStyle(
            color: primaryTextColor,
          ),
          bodyText2: const TextStyle(
            color: primaryTextColor,
          ),
          button: const TextStyle(
            color: primaryTextColor,
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          caption: TextStyle(
            color: primaryTextColor.withOpacity(0.86),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          )),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: primaryColor,
      ),
    );
  }
}
