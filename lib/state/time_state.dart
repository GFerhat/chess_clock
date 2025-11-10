import 'dart:async';
import 'package:chess_clock/state/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final refSettings = NotifierProvider<TimeNotifier, Time>(() => TimeNotifier());

class TimeNotifier extends Notifier<Time> {
  setTime(double time) {
    state = Time(time);
  }

  void startTimer(double time, bool runTime) {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (runTime) {
        time - 0.01;
      }
    });
  }

  void stopTimer(double time, bool runTime) {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (runTime == false) {
        time - 0;
      }
    });
  }

  final bullet = Time(60);
  final blitz = Time(180);
  final rapid = Time(900);

  @override
  Time build() => Time(state.time);
}
