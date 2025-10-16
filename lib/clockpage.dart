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
      body: Column(
        children: [
          // Upper half: Black background with timer and button
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeLeft == -1 ? 'time out' : '$timeLeft',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ), // white text for visibility
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      _startTimer();
                    },
                    child: Text(
                      'START TIMER',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ),
          // Lower half: White background, empty or add custom widget
          Expanded(
            child: Container(
              color: Colors.white,
              // Add more widgets here if needed
            ),
          ),
        ],
      ),
    );
  }
}
