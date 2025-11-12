import 'package:chess_clock/state/gamemode_state.dart';



class GameTweaks {
  final List<List<Map<String, double>>> gameTweaks = [
    [
      {'increment': 0, 'gameTime': 60},
      {'increment': 0, 'gameTime': 120},
      {'increment': 2, 'gameTime': 60},
    ],
    [
      {'increment': 0, 'gameTime': 180},
      {'increment': 0, 'gameTime': 300},
      {'increment': 2, 'gameTime': 180},
    ],
    [
      {'increment': 0, 'gameTime': 600},
      {'increment': 0, 'gameTime': 900},
      {'increment': 2, 'gameTime': 600},
    ],
    [
      {'increment': 0, 'gameTime': 2400},
      {'increment': 0, 'gameTime': 3600},
      {'increment': 10, 'gameTime': 2400},
    ],
  ];

  double? gametime;
  double? increment;
  GameTweaks(Gamemode mode, int variant) {
    Map<String, double> params = gameTweaks[mode.index][variant];
    increment = params['increment'];
    gametime = params['gametime'];
  }
}
