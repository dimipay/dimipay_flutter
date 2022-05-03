import 'package:flutter/services.dart';

class HapticPattern {
  final List<int> ticks;
  HapticPattern(this.ticks);
}

class HapticPatterns {
  static final error = HapticPattern([0, 150, 300]);
  static final transactionSuccess = HapticPattern([300, 500]);
}

abstract class HapticHelper {
  static Future feedback(HapticPattern pattern) async {
    List<Future> tasks = [];

    for (var tick in pattern.ticks) {
      tasks.add(Future.delayed(Duration(milliseconds: tick), HapticFeedback.heavyImpact));
    }

    await Future.wait(tasks);
  }
}
