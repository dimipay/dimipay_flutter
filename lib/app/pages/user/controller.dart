import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserPageController extends GetxController {
  UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    userController.fetchUser();
    super.onInit();
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await userController.fetchUser();
    HapticFeedback.mediumImpact();
  }
}
