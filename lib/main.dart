import 'package:chess_clock/config.dart';
import 'package:chess_clock/gui/clockpage.dart';
import 'package:chess_clock/gui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        Config.clockpage => ClockPage(),
        Config.homepage => Homepage(),
      },
    );
  }
}
