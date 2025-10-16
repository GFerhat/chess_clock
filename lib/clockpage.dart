import 'dart:async';

import 'package:flutter/material.dart';

class Clockpage extends StatefulWidget {
  const Clockpage({super.key});

  @override
  State<Clockpage> createState() => _ClockpageState();
}

class _ClockpageState extends State<Clockpage> {
  var timeLeft = 3.0;
  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > -1) {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Clock')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(decoration: BoxDecoration(color: Colors.black)),
            Container(
              color: Colors.white,
              child: Text(
                timeLeft == -1 ? 'time out' : '$timeLeft',
                style: TextStyle(fontSize: 40),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _startTimer();
              },
              child: Text('START TIMER', style: TextStyle(color: Colors.white)),
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
