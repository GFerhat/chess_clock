import 'package:chess_clock/notifier_provider/open_bar_index_provider.dart';
import 'package:chess_clock/widgets/time_gridview.dart';
import 'package:chess_clock/models/gamemode_state.dart';
import 'package:chess_clock/notifier_provider/gamemode_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseGamemodePage extends ConsumerWidget {
  const ChooseGamemodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openedBarIndex = ref.watch(openedBarIndexProvider);
    final gamemodeNotifier = ref.read(gamemodeProvider.notifier);
    void toggleBar(int index) {
      ref.read(openedBarIndexProvider.notifier).toggleBar(index);
    }

    final List<String> gamemode = ['BULLET', 'BLITZ', 'RAPID', 'CLASSICAL'];
    return Scaffold(
      appBar: AppBar(title: const Text('G A M E   M O D E'), centerTitle: true),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              final isOpen = openedBarIndex == index;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      toggleBar(index);
                      gamemodeNotifier.setState(Gamemode.values[index]);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 450),
                      curve: Curves.easeInOut,
                      color: isOpen ? Colors.blue[400] : Colors.black,
                      height: 120,
                      child: Center(
                        child: Text(
                          gamemode[index],
                          textScaler: TextScaler.linear(2),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOut,
                    child: isOpen ? TimeGridView() : const SizedBox.shrink(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
