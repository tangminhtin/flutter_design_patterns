import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';

final ThemeData lightTheme = ThemeData(
  backgroundColor: lightBackgroundColor,
  scaffoldBackgroundColor: lightBackgroundColor,
  typography: Typography(
    englishLike: Typography.englishLike2021,
    dense: Typography.dense2021,
    tall: Typography.tall2021,
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 34.0,
      color: Colors.black.withOpacity(0.75),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24.0,
      color: Colors.black.withOpacity(0.65),
    ),
    titleMedium: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 20.0,
      color: Colors.black.withOpacity(0.65),
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      color: Colors.black.withOpacity(0.65),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.0,
      color: Colors.black.withOpacity(0.65),
    ),
    bodySmall: TextStyle(
      fontFamily: 'RobotoMedium',
      fontSize: 14.0,
      color: Colors.black.withOpacity(0.65),
    ),
  ),
);
