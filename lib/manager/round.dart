import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundManager = StateNotifierProvider<RoundManager, bool>((ref) {
  return RoundManager();
});

class RoundManager extends StateNotifier<bool> {
  RoundManager() : super(true);

  void end() {
    state = true;
  }

  void begin() {
    state = false;
  }
}
