import 'package:chess_clock/state/time.dart';

class TimeState {
  final Time timeBlack;
  final Time timeWhite;
  final bool init;

  TimeState({
    required this.timeBlack,
    required this.timeWhite,
    required this.init,
  });

  TimeState copyWith({Time? timeBlack, Time? timeWhite, bool? init}) {
    return TimeState(
      init: init ?? this.init,
      timeBlack: timeBlack ?? this.timeBlack,
      timeWhite: timeWhite ?? this.timeWhite,
    );
  }
}
