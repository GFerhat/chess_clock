import 'package:chess_clock/models/gamemode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameTweaksProvider = NotifierProvider<GameTweaksNotifier, TimeTweak?>(
  () => GameTweaksNotifier(),
);

class GameTweaksNotifier extends Notifier<TimeTweak?> {
  @override
  TimeTweak? build() => null;

  void updateGameTweaks(Gamemode mode, int variant) {
    state = GameTweaks.gameTweaks[mode.index][variant];
  }
}

class GameTweaks {
  static List<List<TimeTweak>> gameTweaks = [
    [
      TimeTweak(increment: 0, gametime: 2),
      TimeTweak(increment: 0, gametime: 120),
      TimeTweak(increment: 2, gametime: 60),
    ],
    [
      TimeTweak(increment: 0, gametime: 180),
      TimeTweak(increment: 0, gametime: 300),
      TimeTweak(increment: 3, gametime: 180),
    ],
    [
      TimeTweak(increment: 0, gametime: 600),
      TimeTweak(increment: 0, gametime: 900),
      TimeTweak(increment: 10, gametime: 600),
    ],
    [
      TimeTweak(increment: 0, gametime: 2700),
      TimeTweak(increment: 0, gametime: 7200),
      TimeTweak(increment: 15, gametime: 2700),
    ],
  ];

  int gametime;
  int increment;

  GameTweaks(Gamemode mode, int variant)
    : increment = gameTweaks[mode.index][variant].increment,
      gametime = gameTweaks[mode.index][variant].gametime;
}

class TimeTweak {
  final int increment;
  final int gametime;
  TimeTweak({required this.increment, required this.gametime});
}
