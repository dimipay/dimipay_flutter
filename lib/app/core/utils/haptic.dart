import 'package:flutter/services.dart';

enum HapticType {
  light,
  medium,
  heavy,
  vibrate,
}

class HapticPattern {
  final List<int> ticks;
  HapticPattern(this.ticks);
}

class HapticPatterns {
  static final error = HapticPattern([0, 150, 300]);
  static final success = HapticPattern([300, 500]);
  static final once = HapticPattern([0]);
}

abstract class HapticHelper {
  static Future feedback(HapticPattern pattern, {HapticType hapticType = HapticType.medium}) async {
    List<Future> tasks = [];
    late void Function() haptic;
    switch (hapticType) {
      case HapticType.light:
        haptic = HapticFeedback.lightImpact;
        break;
      case HapticType.medium:
        haptic = HapticFeedback.mediumImpact;
        break;
      case HapticType.heavy:
        haptic = HapticFeedback.heavyImpact;
        break;
      case HapticType.vibrate:
        haptic = HapticFeedback.vibrate;
    }

    for (var tick in pattern.ticks) {
      tasks.add(Future.delayed(Duration(milliseconds: tick), haptic));
    }

    await Future.wait(tasks);
  }
}
