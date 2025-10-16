import 'package:chess_clock/clockpage.dart';
import 'package:chess_clock/config.dart';
import 'package:chess_clock/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final config = Config.clockpage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: switch (config) {
        Config.clockpage => Clockpage(),
        Config.homepage => Homepage(),
      },
    );
  }
}
