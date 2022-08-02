import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/pages/pin_auth/controller.dart';
import 'package:dimipay/app/pages/pin_auth/widget/numberpad_item.dart';
import 'package:dimipay/app/pages/pin_auth/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinAuthPage extends GetView<PinAuthPageController> {
  const PinAuthPage({Key? key}) : super(key: key);

  buildPassword() {
    return Obx(() => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PasswordField(fieldType: controller.getPwdFieldType(1)),
        SizedBox(width: 16),
        PasswordField(fieldType:controller.getPwdFieldType(2)),
        SizedBox(width: 16),
        PasswordField(fieldType: controller.getPwdFieldType(3)),
        SizedBox(width: 16),
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
                    onTap: () => controller.clickBackspace(),
                    child: Icon(Icons.backspace_outlined, color: DPColors.DARK3, size: 22)
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
    List<int> numList = [1,2,3,4,5,6,7,8,9,0];
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
                    const Text(
                      "결제 비밀번호 입력",
                      style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 24, height: 1.2, color: DPColors.MAIN_THEME),
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
