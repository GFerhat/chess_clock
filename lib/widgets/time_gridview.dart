import 'package:chess_clock/pages/game_page.dart';
import 'package:chess_clock/notifier_provider/game_tweaks_notfier.dart';
import 'package:chess_clock/models/gamemode_state.dart';
import 'package:chess_clock/notifier_provider/gamemode_state_provider.dart';
import 'package:chess_clock/notifier_provider/time_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeGridView extends ConsumerWidget {
  const TimeGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNotifier = ref.read(timeProvider.notifier);
    final gamemodeState = ref.watch(gamemodeProvider);

    final Gamemode currentGamemode = gamemodeState.gamemode;

    const int variantsCount = 3;
    return GridView.count(
      crossAxisCount: variantsCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(variantsCount, (variant) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () {
            ref
                .read(gameTweaksProvider.notifier)
                .updateGameTweaks(currentGamemode, variant);

            final selected = ref.watch(gameTweaksProvider);
            //set die Zeit im Timer
            timeNotifier.setTime(selected!);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GamePage()),
            );
          },
          child: Text(
            currentGamemode.modes[variant],
            style: TextStyle(fontSize: 20),
          ),
        );
      }),
    );
  }
}
