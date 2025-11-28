enum Gamemode {
  bullet(modes: ['1', '2', '2+1']),
  blitz(modes: ['3', '5', '3+3']),
  rapid(modes: ['10', '15', '10+10']),
  classical(modes: ['45', '120', '45+15']),
  none(modes: ['0', '0', '0']);

  final List<String> modes;

  const Gamemode({required this.modes});
}

class GamemodeTypeState {
  final Gamemode gamemode;

  GamemodeTypeState({required this.gamemode});
}
