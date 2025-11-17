import 'dart:async';
import 'package:chess_clock/state/game_tweaks_notfier.dart';
import 'package:chess_clock/state/gamemode_state_provider.dart';
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

  void setTime(TimeTweak timeTweak) {
    initTimeWhite(timeTweak);
    initTimeBlack(timeTweak);
  }

  void initTimeBlack(TimeTweak timeTweak) {
    state = state.copyWith(
      timeBlack: state.timeBlack.copyWith(time: timeTweak.gametime.toDouble()),
    );
  }

  void initTimeWhite(TimeTweak timeTweak) {
    state = state.copyWith(
      timeWhite: state.timeWhite.copyWith(time: timeTweak.gametime.toDouble()),
    );
  }

  void startTimerWhite() {
    if (state.init == false) {}
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
      incrementTimeWhite();
      stopTimerWhite();
      startTimerBlack();
    } else {
      incrementTimeBlack();
      stopTimerBlack();
      startTimerWhite();
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

  /*in the making
    
    String toClocktimerAsString(double time) {
    var clockTimeAsString =
        '${getMinutesToString(time)} : ${getSecondsToString(time)}';
    return clockTimeAsString;
  }

  String getMinutesToString(double time) {
    int minutes = (time / 60.0).floor();
    return minutes.toString();
  }

  String getSecondsToString(double time) {
    var secondsToString = '';
    return secondsToString;
  }*/
}
