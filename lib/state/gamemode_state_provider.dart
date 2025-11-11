import 'dart:developer';

import 'package:chess_clock/state/gamemode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamemodeProvider = NotifierProvider<GamemodeNotifier, GamemodeTypeState>(
  () => GamemodeNotifier(),
);

class GamemodeNotifier extends Notifier<GamemodeTypeState> {
  @override
  GamemodeTypeState build() => GamemodeTypeState(gamemode: Gamemode.none);
  void setState(Gamemode mode) {
    state = GamemodeTypeState(gamemode: mode);
    log('gamemode $mode');
  }
}
