import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppConfigService extends GetxController {
  late Box box;

  Future<AppConfigService> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('config');
    return this;
  }

  void clearConfigs() {
    box.clear();
  }

  @override
  void onClose() async {
    await box.close();
    super.onClose();
  }
}
