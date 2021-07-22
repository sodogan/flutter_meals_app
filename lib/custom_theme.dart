import 'package:flutter/material.dart';

class CustomTheme {
  final TextTheme? textTheme;
  CustomTheme({TextTheme? textTheme})
      : textTheme = textTheme ??
            ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                  ),
                  bodyText1: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                  ),
                  bodyText2: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );

  ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: textTheme,
    );
  }
}
