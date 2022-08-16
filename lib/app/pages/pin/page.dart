import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
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
                    onTap: controller.onClickPad,
                    value: "${nums[0]}",
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
                  child: Container(),
                ),
                Expanded(
                  child: NumberPadItem(
                    onTap: controller.onClickPad,
                    value: "${nums[9]}",
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
                      ),
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
