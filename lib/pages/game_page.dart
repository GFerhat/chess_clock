import 'package:chess_clock/notifier_provider/time_state_notifier.dart';
import 'package:chess_clock/widgets/black_clock_interface.dart';
import 'package:chess_clock/widgets/lose_screen.dart';
import 'package:chess_clock/widgets/white_clock_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeState = ref.watch(timeProvider);
    final timeNotifier = ref.read(timeProvider.notifier);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) => {timeNotifier.reset()},
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: Text('Clock')),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, //full width horizontally
              children: [
                BlackClockInterface(
                  timeState: timeState,
                  timeNotifier: timeNotifier,
                ),
                WhiteClockInterface(
                  timeState: timeState,
                  timeNotifier: timeNotifier,
                ),
              ],
            ),
            !timeState.init
                ? Center(
                    child: FilledButton(
                      onPressed: () {
                        if (timeState.lastActivePlayer == 'black') {
                          timeNotifier.runTimerBlack();
                        } else {
                          timeNotifier.runTimerWhite();
                        }
                      },
                      child: Text('Play'),
                    ),
                  )
                : Center(
                    child: FilledButton(
                      onPressed: () {},
                      onLongPress: timeNotifier.stopTimerAll,
                      child: Text('hold to Stop'),
                    ),
                  ),
            if (timeState.timeRanOut)
              LoseScreen(loser: timeState.loser ?? 'Nobody'),
          ],
        ),
      ),
    );
  }
}
