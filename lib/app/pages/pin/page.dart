import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:dimipay/app/pages/pin/widget/numberpad_item.dart';
import 'package:dimipay/app/pages/pin/widget/password_field.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PinPage extends GetView<PinPageController> {
  const PinPage({Key? key}) : super(key: key);

  buildPassword() {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ignore: prefer_is_empty
            PasswordField(filled: controller.password.value.length >= 1),
            const SizedBox(width: 16),
            PasswordField(filled: controller.password.value.length >= 2),
            const SizedBox(width: 16),
            PasswordField(filled: controller.password.value.length >= 3),
            const SizedBox(width: 16),
            PasswordField(filled: controller.password.value.length >= 4),
          ],
        ));
  }

  buildNumberPad(List<int> nums) {
    return Obx(
      () => SizedBox(
        width: 300,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[0]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[0]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[1]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[1]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[2]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[2]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[3]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[3]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[4]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[4]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[5]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[5]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[6]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[6]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[7]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[7]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[8]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[8]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () {
                        if (controller.faceIdAvailable && controller.pinPageType == PinPageType.pinAuth) {
                          return GestureDetector(
                            onTap: controller.biometricAuth,
                            child: Center(
                              child: SvgPicture.asset('asset/images/face_id.svg', height: 28),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "${nums[9]}",
                      disabled: controller.isPinLocked.value,
                      child: Text(
                        "${nums[9]}",
                        style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NumberPadItem(
                      onTap: controller.onClickPad,
                      value: "\b",
                      disabled: controller.password.value.isEmpty,
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: DPColors.DARK1,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<int> numList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    numList.shuffle();

    return Scaffold(
      appBar: const DPAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        controller.title.value,
                        style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 24, height: 1.2, color: DPColors.MAIN_THEME),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        controller.subTitle.value,
                        style: DPTextTheme.DESCRIPTION,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      if (controller.isPinLocked.value) {
                        return GestureDetector(
                          onTap: () => launchUrl(Uri.parse('http://pf.kakao.com/_gHxlCxj/chat')),
                          child: const Text(
                            '핀 복구하기',
                            style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 16, height: 1.2, color: DPColors.MAIN_THEME, decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                    const SizedBox(height: 24),
                    buildPassword(),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              buildNumberPad(numList),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
