import 'package:chess_clock/models/time.dart';

class TimeState {
  final Time timeBlack;
  final Time timeWhite;
  final bool init;
  final String? lastActivePlayer;

  TimeState({
    required this.timeBlack,
    required this.timeWhite,
    required this.init,
    this.lastActivePlayer,
  });

  TimeState copyWith({
    Time? timeBlack,
    Time? timeWhite,
    bool? init,
    String? lastActivePlayer,
  }) {
    return TimeState(
      init: init ?? this.init,
      timeBlack: timeBlack ?? this.timeBlack,
      timeWhite: timeWhite ?? this.timeWhite,
      lastActivePlayer: lastActivePlayer ?? this.lastActivePlayer,
    );
  }
}
