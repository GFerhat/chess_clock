import 'dart:async';
import 'package:chess_clock/state/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = NotifierProvider<TimeNotifier, Time>(() => TimeNotifier());

class TimeNotifier extends Notifier<Time> {
  Timer? _timer;

  @override
  Time build() => Time(0); // default time

  void setTime(double newTime) {
    state = Time(newTime, runTime: state.runTime);
  }

  void startTimer() {
    if (_timer == null) return;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (!state.runTime) {
        state = Time(state.time - 0.01, runTime: true);
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    state = Time(state.time, runTime: false);
  }

  void toggleRunTime() {
    state = Time(state.time, runTime: !state.runTime);
  }

  final Map<String, double> timePresets = {
    'bulletOneMin': 60,
    'bulletTwoMin': 120,
    'blitzThreeMin': 180,
    'blitzFiveMin': 300,
    'rapidTenMin': 600,
    'rapid15Min': 900,
  };
}
