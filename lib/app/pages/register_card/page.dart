import 'package:dimipay/app/data/modules/manage_method/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPage extends GetView<ManageMethodController> {
  RegisterCardPage({Key? key}) : super(key: key);

  final ManageMethodController manageMethodController = Get.find<ManageMethodController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Register Card Page')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      DPSmallTextButton(
                          text: "스캐너",
                          onTap: () {
                            manageMethodController.scanCreditCard();
                          }),
                      const SizedBox(height: 32),
                      DPTextField(
                        controller: controller.cardNumberFieldController,
                        label: '카드 번호',
                        textInputType: TextInputType.text,
                        maxLength: 16,
                        hintText: '카드 번호 16자리를 입력해주세요',
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Flexible(
                            child: DPTextField(
                              controller: controller.expireDateFieldController,
                              label: '유효기간',
                              maxLength: 4,
                              textInputType: TextInputType.number,
                              hintText: 'MM/YY',
                            ),
                          ),
                          const SizedBox(width: 18),
                          Flexible(
                            child: DPTextField(
                              controller: controller.birthdayFieldController,
                              label: '생년 월일',
                              maxLength: 6,
                              textInputType: TextInputType.number,
                              hintText: '6자리로 입력',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      DPTextField(
                        controller: controller.passwordFieldController,
                        label: '비밀번호',
                        isPassword: true,
                        maxLength: 2,
                        textInputType: TextInputType.number,
                        hintText: '앞 2자리를 입력해주세요',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DPKeyboardReactiveButton(
              onTap: () {
                manageMethodController.createGeneralCard();
              },
              padding: const EdgeInsets.all(24),
              child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
