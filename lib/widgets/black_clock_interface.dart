import 'package:chess_clock/models/time_state.dart';
import 'package:chess_clock/notifier_provider/time_state_notifier.dart';
import 'package:flutter/material.dart';

class BlackClockInterface extends StatelessWidget {
  const BlackClockInterface({
    super.key,
    required this.timeState,
    required this.timeNotifier,
  });

  final TimeState timeState;
  final TimeNotifier timeNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      //Black
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeNotifier.toClocktimerAsString(timeState.timeBlack.time),
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            if (timeState.timeBlack.runTime)
              MaterialButton(
                onPressed: () {
                  timeNotifier.toggleRunTime();
                },
                color: Colors.deepPurple,
                child: Text('PASS TURN', style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
