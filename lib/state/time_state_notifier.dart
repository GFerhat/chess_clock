import 'dart:async';
import 'package:chess_clock/state/time.dart';
import 'package:chess_clock/state/time_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = NotifierProvider<TimeNotifier, TimeState>(
  () => TimeNotifier(),
);

class TimeNotifier extends Notifier<TimeState> {
  Timer? _timerWhite;
  Timer? _timerBlack;

  @override
  TimeState build() => TimeState(
    timeBlack: Time(time: 0, runTime: false),
    timeWhite: Time(time: 0, runTime: false),
    init: false,
  ); // default time

  void setTime(double newTime) {
    setTimeWhite(newTime);
    setTimeBlack(newTime);
  }

  void setTimeBlack(double newTime) {
    state = state.copyWith(timeBlack: state.timeBlack.copyWith(time: newTime));
  }

  void setTimeWhite(double newTime) {
    state = state.copyWith(timeWhite: state.timeWhite.copyWith(time: newTime));
  }

  void startTimerWhite() {
    if (state.init == false) {
      state = state.copyWith(init: true);
    }
    _timerWhite = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      state = state.copyWith(
        timeWhite: state.timeWhite.copyWith(
          time: state.timeWhite.time - 0.01,
          runTime: true,
        ),
      );
    });
  }

  void startTimerBlack() {
    if (state.init == false) {
      state = state.copyWith(init: true);
    }
    _timerBlack = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      state = state.copyWith(
        timeBlack: state.timeBlack.copyWith(
          time: state.timeBlack.time - 0.01,
          runTime: true,
        ),
      );
    });
  }

  void stopTimerWhite() {
    _timerWhite?.cancel();
    state = state.copyWith(timeWhite: state.timeWhite.copyWith(runTime: false));
  }

  void stopTimerBlack() {
    _timerBlack?.cancel();
    state = state.copyWith(timeBlack: state.timeBlack.copyWith(runTime: false));
  }

  void toggleRunTime() {
    if (state.timeWhite.runTime) {
      stopTimerWhite();
      startTimerBlack();
    } else {
      stopTimerBlack();
      startTimerWhite();
    }
  }

  void reset() {
    state = TimeState(
      timeBlack: Time(time: 0, runTime: false),
      timeWhite: Time(time: 0, runTime: false),
      init: false,
    );
    _timerBlack = null;
    _timerWhite = null;
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
