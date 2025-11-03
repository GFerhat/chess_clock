import 'package:chess_clock/gui/choose_gamemode_page.dart';
import 'package:chess_clock/gui/game_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseGamemodePage()),
                );
              },
              child: Text("PLAY"),
            ),
          ],
        ),
      ),
    );
  }
}
