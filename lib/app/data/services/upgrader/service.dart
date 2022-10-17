import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeService extends GetxService {
  static const String _appcastURL = 'https://raw.githubusercontent.com/dimipay/dimipay_flutter/53930b41269bcef0c13da96d9e24b2d653896af9/lib/app/data/services/upgrader/appcast.xml';

  final upgradeCheck = Upgrader(
    appcastConfig: AppcastConfiguration(url: _appcastURL, supportedOS: ['android', 'ios']),
    debugLogging: true, // REMOVE this for release builds
    showIgnore: false,
    showLater: false,
    dialogStyle: GetPlatform.isAndroid ? UpgradeDialogStyle.material : UpgradeDialogStyle.cupertino,
  );

  @override
  void onInit() async {
    await Upgrader.clearSavedSettings(); // REMOVE this for release builds
    super.onInit();
  }
}
