import 'package:flutter/material.dart';

import '../constants/constants.dart';

final _baseTheme = ThemeData.light();

ThemeData get appTheme => ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      // scaffoldBackgroundColor: kSecondrayColor,
      textTheme: _baseTheme.textTheme.apply(
        fontFamily: appFontFamily,
      ),
      primaryTextTheme: _baseTheme.primaryTextTheme.apply(
        fontFamily: appFontFamily,
      ),
      colorScheme: _baseTheme.colorScheme.copyWith(
        primary: primaryColor,
        // secondary: kSecondrayColor,
        background: Colors.white,
      ),
      appBarTheme: _baseTheme.appBarTheme.copyWith(
        elevation: 0,
        // backgroundColor: kSecondrayColor,
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
      ),
    );
