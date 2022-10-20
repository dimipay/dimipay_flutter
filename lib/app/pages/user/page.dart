import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:dimipay/app/pages/user/controller.dart';
import 'package:dimipay/app/pages/user/widget/menu_item.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends GetView<UserPageController> {
  UserPage({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();

  Widget _userName() {
    return userController.obx(
      (state) => Text(state!.name, style: DPTextTheme.REGULAR_IMPORTANT),
      onLoading: const Text('loading...', style: DPTextTheme.REGULAR_IMPORTANT),
    );
  }

  Widget _userId() {
    return userController.obx(
      (state) => Text(state!.accountName, style: DPTextTheme.DESCRIPTION),
      onLoading: const Text('loading...', style: DPTextTheme.DESCRIPTION),
    );
  }

  Widget _profileArea() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        userController.obx(
          (state) {
            String? profileImageUrl = userController.user?.profileImage;
            if (profileImageUrl == null) {
              return const CircleAvatar(backgroundColor: DPColors.DARK6, radius: 24);
            } else {
              return CircleAvatar(backgroundImage: NetworkImage(profileImageUrl), backgroundColor: DPColors.DARK6, radius: 24);
            }
          },
          onLoading: const CircleAvatar(backgroundColor: DPColors.DARK6, radius: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userName(),
            _userId(),
          ],
        ),
      ],
    );
  }

  Widget _topArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          _profileArea(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _menuArea() {
    return Obx(
      () => Column(
        children: [
          UserPageListItem(
            title: '카드',
            onTap: () => Get.toNamed(Routes.MANAGEMETHOD),
            trailingText: '${(controller.paymentMethodController.paymentMethods?.length ?? '').toString()}개',
          ),
          UserPageListItem(
            title: '결제기록',
            onTap: () => Get.toNamed(Routes.HISTORY),
          ),
          UserPageListItem(
            title: '페이스사인',
            trailingText: controller.faceSignController.isFacesignRegistered == true ? '등록 됨' : '등록 안됨',
            onTap: () {
              switch (controller.faceSignController.isFacesignRegistered) {
                case true:
                  Get.toNamed(Routes.FACESIGN_DELETE);
                  break;
                case false:
                  Get.toNamed(Routes.FACESIGN_INTRODUCE);
                  break;
              }
            },
          ),
          UserPageListItem(
            title: '핀 변경',
            onTap: () => Get.toNamed(Routes.PIN, arguments: {'pinPageType': PinPageType.changePin}),
          ),
          UserPageListItem(
            title: '문의',
            onTap: () => controller.openKakaoChannelTalk(),
          ),
          UserPageListItem(
            title: '로그아웃',
            trailing: false,
            onTap: () {
              if (GetPlatform.isIOS) {
                showCupertinoDialog(
                  context: Get.overlayContext!,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    content: const Text('정말 로그아웃 할까요?'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('취소'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Get.find<AuthService>().logout();
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: const Text('로그아웃'),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog<String>(
                  context: Get.overlayContext!,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('정말 로그아웃 할까요?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<AuthService>().logout();
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: const Text('로그아웃', style: TextStyle(color: DPColors.ERROR)),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          color: DPColors.MAIN_THEME,
          onRefresh: controller.refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _topArea(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Divider(color: DPColors.DARK6, height: 1, thickness: 1),
                ),
                const SizedBox(height: 16),
                _menuArea(),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
