import 'dart:async';
import 'package:chess_clock/notifier_provider/game_tweaks_notfier.dart';
import 'package:chess_clock/notifier_provider/gamemode_state_provider.dart';
import 'package:chess_clock/models/time.dart';
import 'package:chess_clock/models/time_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const secondsPerTick = 0.01;
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

  void setTime(TimeTweak timeTweak) {
    setTimeWhite(timeTweak);
    setTimeBlack(timeTweak);
  }

  void setTimeBlack(TimeTweak timeTweak) {
    state = state.copyWith(
      timeBlack: state.timeBlack.copyWith(time: timeTweak.gametime.toDouble()),
    );
  }

  void setTimeWhite(TimeTweak timeTweak) {
    state = state.copyWith(
      timeWhite: state.timeWhite.copyWith(time: timeTweak.gametime.toDouble()),
    );
  }

  bool checkForTimeout() {
    String loser = 'White';
    if (state.timeWhite.time <= secondsPerTick ||
        state.timeBlack.time <= secondsPerTick) {
      stopTimerAll();
      if (state.timeBlack.time <= secondsPerTick) loser = 'black';
      state = state.copyWith(loser: loser, timeRanOut: true);
      return true;
    }
    return false;
  }

  void runTimerWhite() {
    if (state.init == false) {}
    _timerWhite = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (checkForTimeout()) return;
      state = state.copyWith(
        init: true,
        timeWhite: state.timeWhite.copyWith(
          time: state.timeWhite.time - secondsPerTick,
          runTime: true,
        ),
      );
    });
  }

  void runTimerBlack() {
    if (state.init == false) {
      state = state.copyWith(init: true);
    }
    _timerBlack = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (checkForTimeout()) return;
      state = state.copyWith(
        init: true,
        timeBlack: state.timeBlack.copyWith(
          time: state.timeBlack.time - secondsPerTick,
          runTime: true,
        ),
      );
    });
  }

  stopTimerAll() {
    final lastActive = state.timeBlack.runTime ? 'black' : 'white';
    state = state.copyWith(init: false, lastActivePlayer: lastActive);
    stopTimerBlack();
    stopTimerWhite();
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
      incrementTimeWhite();
      stopTimerWhite();
      runTimerBlack();
    } else {
      incrementTimeBlack();
      stopTimerBlack();
      runTimerWhite();
    }
  }

  incrementTimeWhite() {
    final variant = ref.read(gameTweaksProvider);
    state = state.copyWith(
      timeWhite: state.timeWhite.copyWith(
        time: state.timeWhite.time + variant!.increment,
      ),
    );
  }

  incrementTimeBlack() {
    final variant = ref.read(gameTweaksProvider);
    state = state.copyWith(
      timeBlack: state.timeBlack.copyWith(
        time: state.timeBlack.time + variant!.increment,
      ),
    );
  }

  void reset() {
    stopTimerWhite();
    stopTimerBlack();
    state = TimeState(
      timeBlack: Time(time: 0, runTime: false),
      timeWhite: Time(time: 0, runTime: false),
      init: false,
    );
    _timerBlack = null;
    _timerWhite = null;
  }

  String toClocktimerAsString(double time) {
    return '${_getMinutesToString(time)} : ${_getSecondsToString(time)}';
  }

  String _getMinutesToString(double time) {
    int minutes = (time / 60.0).floor();
    return minutes.toString().padLeft(2, '0');
  }

  String _getSecondsToString(double time) {
    final seconds = (time % 60).floor();
    return seconds.toString().padLeft(2, '0');
  }
}
