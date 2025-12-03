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