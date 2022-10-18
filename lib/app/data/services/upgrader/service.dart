import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class DPUpgraderMessages extends UpgraderMessages {
  @override
  String get title => '업데이트 설치 가능';

  @override
  String get body => '디미페이의 새 버전이 출시되었습니다.';

  @override
  String get prompt => '버그 수정 및 보안 업데이트를 포함하므로 업데이트를 권장합니다.';

  @override
  String get releaseNotes => '릴리즈 노트';
}

class UpgraderService extends GetxService {
  //iOS Simulator 에서는 작동이 안되는 오류가 있는데, 이는 앱스토어가 깔려있지 않아 발생하는 문제로 실제 기기에서는 정상 작동합니다.
  final upgrader = Upgrader(
    appcastConfig: AppcastConfiguration(
      supportedOS: ['android', 'ios'],
    ),
    shouldPopScope: () => true,
    messages: DPUpgraderMessages(),
    durationUntilAlertAgain: const Duration(days: 1),
    debugLogging: !kReleaseMode, // REMOVE this for release builds
    showIgnore: false,
    dialogStyle: GetPlatform.isAndroid ? UpgradeDialogStyle.material : UpgradeDialogStyle.cupertino,
  );

  Future<UpgraderService> init() async {
    await upgrader.initialize();
    upgrader.showLater = !upgrader.belowMinAppVersion();
    return this;
  }
}
