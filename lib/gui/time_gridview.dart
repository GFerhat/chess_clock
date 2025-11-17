import 'package:chess_clock/gui/game_page.dart';
import 'package:chess_clock/state/game_tweaks_notfier.dart';
import 'package:chess_clock/state/gamemode_state.dart';
import 'package:chess_clock/state/gamemode_state_provider.dart';
import 'package:chess_clock/state/time_state_notifier.dart';
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

  // String _getButtonText(Gamemode mode, int variant) {
  //   switch (mode) {
  //     case Gamemode.bullet:
  //       const texts = ['1', '2', '1+2'];
  //       return texts[variant];
  //     case Gamemode.blitz:
  //       const texts = ['3', '5', '3+2'];
  //       return texts[variant];
  //     case Gamemode.rapid:
  //       const texts = ['10', '15', '10+2'];
  //       return texts[variant];
  //     case Gamemode.classical:
  //       const texts = ['40', '60', '40+10'];
  //       return texts[variant];
  //     case Gamemode.none:
  //       return '';
  //   }
  // }
}
