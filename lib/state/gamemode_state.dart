enum Gamemode {
  bullet(modes: ['1', '2', '2+4']),
  blitz(modes: ['1', '2', '2+4']),
  rapid(modes: ['1', '2', '2+4']),
  classical(modes: ['1', '2', '2+4']),
  none(modes: ['1', '2', '2+4']);

  final List<String> modes;

  const Gamemode({required this.modes});
}

class GamemodeTypeState {
  final Gamemode gamemode;

  GamemodeTypeState({required this.gamemode});
}
