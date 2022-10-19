import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import 'package:version/version.dart';

class DPUpgradeMessages extends UpgraderMessages {
  @override
  String get title => '업데이트 설치 가능';

  @override
  String get body => '디미페이의 새 버전이 출시되었습니다.';

  @override
  String get prompt => '버그 수정 및 보안 업데이트를 포함하므로 업데이트를 권장합니다.';

  @override
  String get releaseNotes => '릴리즈 노트';
}

class DPForceUpgradeMessages extends DPUpgradeMessages {
  @override
  String get title => '업데이트 설치 안내';
  @override
  String get prompt => '중대한 버그 수정 및 보안 업데이트를 포함하므로 업데이트 해야합니다.';
}

class UpgraderService extends GetxService {
  final Appcast appcast = Appcast();
  late final Upgrader upgrader;
  bool shouldForceUpgrade() {
    return appcast.items!.where((appCastItem) => Version.parse(appCastItem.versionString!) > Version.parse(upgrader.currentInstalledVersion()!)).any((element) => element.isCriticalUpdate);
  }

  //iOS Simulator 에서는 작동이 안되는 오류가 있는데, 이는 앱스토어가 깔려있지 않아 발생하는 문제로 실제 기기에서는 정상 작동합니다.

  Future<UpgraderService> init() async {
    await appcast.parseAppcastItemsFromUri('https://terrible-termite-17.telebit.io/appcast.xml');

    upgrader = Upgrader(
      appcastConfig: AppcastConfiguration(
        supportedOS: ['android', 'ios'],
      ),
      shouldPopScope: () => true,
      debugDisplayAlways: true,
      durationUntilAlertAgain: const Duration(days: 1),
      debugLogging: !kReleaseMode, // REMOVE this for release builds
      showIgnore: false,
      dialogStyle: GetPlatform.isAndroid ? UpgradeDialogStyle.material : UpgradeDialogStyle.cupertino,
    );
    await upgrader.initialize();
    upgrader.showLater = !shouldForceUpgrade();
    upgrader.messages = shouldForceUpgrade() ? DPForceUpgradeMessages() : DPUpgradeMessages();
    return this;
  }
}
