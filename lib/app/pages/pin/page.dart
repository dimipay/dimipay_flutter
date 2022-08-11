import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:dimipay/app/pages/pin/widget/numberpad_item.dart';
import 'package:dimipay/app/pages/pin/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinPage extends GetView<PinPageController> {
  const PinPage({Key? key}) : super(key: key);

  buildPassword() {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PasswordField(fieldType: controller.getPwdFieldType(1)),
            const SizedBox(width: 16),
            PasswordField(fieldType: controller.getPwdFieldType(2)),
            const SizedBox(width: 16),
            PasswordField(fieldType: controller.getPwdFieldType(3)),
            const SizedBox(width: 16),
            PasswordField(fieldType: controller.getPwdFieldType(4)),
          ],
        ));
  }

  buildNumberPad(List<int> nums) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[0]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[1]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[2]}",
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
                    value: "${nums[3]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[4]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[5]}",
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
                    value: "${nums[6]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[7]}",
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[8]}",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: NumberPadItem(
                    value: "${nums[9]}",
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.clickPad('\b'),
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Obx(
                          () => Icon(
                            Icons.backspace_outlined,
                            color: controller.password.value.isEmpty ? DPColors.DARK5 : DPColors.DARK1,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getTitle() {
    AuthService authService = Get.find<AuthService>();
    return authService.isFirstVisit ? "결제 비밀번호 설정" : "결제 비밀번호 입력";
  }

  @override
  Widget build(BuildContext context) {
    List<int> numList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    numList.shuffle();

    return Scaffold(
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
                    Text(
                      getTitle(),
                      style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 24, height: 1.2, color: DPColors.MAIN_THEME),
                    ),
                    const SizedBox(height: 24),
                    buildPassword(),
                  ],
                ),
              ),
              buildNumberPad(numList),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
