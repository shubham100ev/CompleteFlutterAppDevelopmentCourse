import 'package:flutter/material.dart';

import 'ui/home.dart';

final ThemeData _appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.greenAccent,
      scaffoldBackgroundColor: Colors.red[500],
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(fontSize: 18.0),
      caption:
          base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      body1: base.body1.copyWith(fontSize: 16.9, color: Colors.white),
      button: base.button.copyWith(letterSpacing: 2));
}

void main() => runApp(new MaterialApp(
      theme: _appTheme,
//      theme: ThemeData(
//          brightness: Brightness.dark,
//          primaryColor: Colors.red[100],
//          textTheme: TextTheme(
//              headline: TextStyle(fontSize: 24),
//              body1: TextStyle(fontSize: 16))),
      home: QuizApp(),
    ));
