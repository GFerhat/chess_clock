import 'package:chess_clock/gui/game_page.dart';
import 'package:chess_clock/state/time_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeGridView extends ConsumerWidget {
  const TimeGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.read(timeProvider.notifier);
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            // Setze die gewählte Zeit im Provider
            timeNotifier.setTime(100);
            // z. B. 300 für 5 Minuten
            // Öffne die GamePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GamePage()),
            );
          },
          child: const Text('1', textScaler: TextScaler.linear(2)),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {},
          child: const Text('2', textScaler: TextScaler.linear(2)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {},
          child: const Text('3', textScaler: TextScaler.linear(2)),
        ),
      ],
    );
  }
}
