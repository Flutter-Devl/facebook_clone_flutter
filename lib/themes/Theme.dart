// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

ThemeData MyTheme() {
  return ThemeData(
    primaryColor: const Color(0xff1777F0),
    primaryColorDark: const Color(0xff023D87),
    primaryColorLight: const Color(0xffE6F1FF),
    backgroundColor: const Color(0xffCCCFD5),
    scaffoldBackgroundColor: Colors.white,
    highlightColor: const Color(0xffE7F0FE),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Color(0xff1D1E22), fontSize: 26, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    ),
    fontFamily: 'Helvetica Neue',
    dividerColor: const Color(0xffCCCFD5),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffEFF5F5)),
  );
}
