import 'package:chess_clock/state/time_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeState = ref.watch(timeProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Clock')),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // full width horizontally
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${timeState.time}',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  MaterialButton(
                    onPressed: () {
                      ref.read(timeProvider.notifier).startTimer();
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      'START TIMER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${timeState.time}', style: TextStyle(fontSize: 40)),
                  MaterialButton(
                    onPressed: () {
                      ref.read(timeProvider.notifier).startTimer();
                    },
                    color: Colors.deepPurple,
                    child: Text('START TIMER'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
