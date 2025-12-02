import 'package:chess_clock/models/time_state.dart';
import 'package:chess_clock/notifier_provider/time_state_notifier.dart';
import 'package:flutter/material.dart';

class WhiteClockInterface extends StatelessWidget {
  const WhiteClockInterface({
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
      //White
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeState.timeWhite.time.toStringAsFixed(2),
              style: TextStyle(fontSize: 40),
            ),
            if (timeState.timeWhite.runTime)
              MaterialButton(
                onPressed: () {
                  timeNotifier.toggleRunTime();
                },
                color: Colors.deepPurple,
                child: Text('PASS TURN'),
              ),
          ],
        ),
      ),
    );
  }
}