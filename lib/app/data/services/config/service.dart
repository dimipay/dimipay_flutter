import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppConfigService extends GetxService {
  late Box box;

  final String _needOnboarding = 'need_onboarding';

  bool get needOnboarding {
    return box.get(_needOnboarding, defaultValue: true);
  }

  set needOnboarding(bool value) {
    box.put(_needOnboarding, value);
  }

  Future<AppConfigService> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('config');
    return this;
  }

  void clearConfigs() {
    box.delete(_needOnboarding);
  }

  @override
  void onClose() async {
    await box.close();
    super.onClose();
  }
}
