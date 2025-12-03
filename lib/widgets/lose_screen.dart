import 'package:chess_clock/notifier_provider/game_tweaks_notfier.dart';
import 'package:chess_clock/notifier_provider/time_state_notifier.dart';
import 'package:chess_clock/pages/game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoseScreen extends ConsumerWidget {
  const LoseScreen({super.key, required this.loser});
  final String loser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.read(timeProvider.notifier);
    return AlertDialog(
      title: const Text('GAME OVER'),
      content: Text('$loser lost on time'),
      actions: [
        Row(
          children: [
            //restart button
            TextButton(
              onPressed: () {
                final selected = ref.read(gameTweaksProvider);
                if (selected != null) {
                  timeNotifier.reset();
                  timeNotifier.setTime(selected);
                }
              },
              child: const Center(child: Text('Restart')),
            ),
            //choose gamemode button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(child: Text('Back')),
            ),
          ],
        ),
      ],
    );
  }
}
