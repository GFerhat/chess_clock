import 'package:chess_clock/models/time.dart';

class TimeState {
  final Time timeBlack;
  final Time timeWhite;
  final bool init;
  final bool timeRanOut;
  final String? lastActivePlayer;
  final String? loser;

  TimeState({
    this.timeRanOut = false,
    required this.timeBlack,
    required this.timeWhite,
    required this.init,
    this.lastActivePlayer,
    this.loser,
  });

  TimeState copyWith({
    Time? timeBlack,
    Time? timeWhite,
    bool? timeRanOut,
    bool? init,
    String? lastActivePlayer,
    String? loser,
  }) {
    return TimeState(
      init: init ?? this.init,
      timeBlack: timeBlack ?? this.timeBlack,
      timeWhite: timeWhite ?? this.timeWhite,
      lastActivePlayer: lastActivePlayer ?? this.lastActivePlayer,
      loser: loser ?? this.loser,
      timeRanOut: timeRanOut ?? this.timeRanOut,
    );
  }
}
