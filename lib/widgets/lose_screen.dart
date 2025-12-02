import 'package:flutter/material.dart';

class LoseScreen extends StatelessWidget {
  const LoseScreen({super.key, required this.loser});
  final String loser;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('GAME OVER'),
      content: Text('$loser lost on time'),
      actions: [
        Row(
          children: [
            //restart button
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(child: Text('Restart')),
            ),
            //choose gamemode button
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(child: Text('Choose Gamemode')),
            ),
          ],
        ),
      ],
    );
  }
}
