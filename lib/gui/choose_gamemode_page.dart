import 'package:chess_clock/gui/time_gridview.dart';
import 'package:chess_clock/state/gamemode_state.dart';
import 'package:chess_clock/state/gamemode_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final openedBarIndexProvider = NotifierProvider<OpenedBarNotifier, int?>(() {
  return OpenedBarNotifier();
});

class OpenedBarNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void toggleBar(int index) {
    state = state == index ? null : index;
  }
}

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
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('G A M E   M O D E'),
        centerTitle: true,
      ),
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
                          '${gamemode[index]}',
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
