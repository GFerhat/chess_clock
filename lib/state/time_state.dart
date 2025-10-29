import 'dart:async';

import 'package:chess_clock/state/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final refSettings = NotifierProvider<TimeNotifier, Time>(() => TimeNotifier());

class TimeNotifier extends Notifier<Time> {
  setTime(int time) {
    state = Time(time);
  }

  void _startTimer(int time) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > -1) {
        time--;
      }
    });
  }

  @override
  Time build() => Time(state.time);
}
