import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeService extends GetxService {
  static const String _appcastURL = 'https://raw.githubusercontent.com/dimipay/dimipay_flutter/53930b41269bcef0c13da96d9e24b2d653896af9/lib/app/data/services/upgrader/appcast.xml';

  //iOS Simulator 에서는 작동이 안되는 오류가 있는데, 이는 앱스토어가 깔려있지 않아 발생하는 문제로 실제 기기에서는 정상 작동합니다.
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
