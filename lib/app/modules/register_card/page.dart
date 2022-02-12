import 'package:dimipay/app/modules/register_card/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPage extends GetView<RegisterCardPageController> {
  const RegisterCardPage({Key? key}) : super(key: key);

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
                      const SizedBox(height: 32),
                      DPTextField(
                        controller: controller.cardNumberFieldController,
                        label: '카드 번호',
                        hintText: '카드 번호 16자리를 입력해주세요',
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Flexible(
                            child: DPTextField(
                              controller: controller.expireDateFieldController,
                              label: '유효기간',
                              hintText: 'MM/YY',
                            ),
                          ),
                          const SizedBox(width: 18),
                          Flexible(
                            child: DPTextField(
                              controller: controller.birthdayFieldController,
                              label: '생년 월일',
                              hintText: '4자리로 입력',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      DPTextField(
                        controller: controller.passwordFieldController,
                        label: '비밀번호',
                        hintText: '앞 2자리를 입력해주세요',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: const DPMediumTextButton(text: '다음', width: double.infinity),
            )
          ],
        ),
      ),
    );
  }
}
