import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../widgets/snackbar.dart';

class UserPageController extends GetxController {
  UserController userController = Get.find<UserController>();
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  FaceSignController faceSignController = Get.find<FaceSignController>();

  @override
  void onInit() {
    if (userController.user == null) {
      userController.fetchUser();
    }
    if (paymentMethodController.paymentMethods == null) {
      paymentMethodController.fetchPaymentMethods();
    }
    if (faceSignController.isFacesignRegistered == null) {
      faceSignController.fetchIsFacesignRegistered();
    }
    super.onInit();
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await userController.fetchUser();
    HapticFeedback.mediumImpact();
  }

  openKakaoChannelTalk() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await launchBrowserTab(await TalkApi.instance.channelChatUrl('_gHxlCxj'));
      } else {
        DPErrorSnackBar().open("카카오톡이 현재 깔려있지 않습니다.\n설치 후 다시 시도해주세요.");
      }
    } catch (error) {
      PlatformException exception = (error as PlatformException);
      if (exception.code != "CANCELED") {
        DPErrorSnackBar().open("카카오톡을 통한 문의 채널 연결에 실패하였습니다.");
      }
    }
  }
}
