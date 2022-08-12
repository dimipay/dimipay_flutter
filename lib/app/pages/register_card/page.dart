import 'package:dimipay/app/pages/register_card/controller.dart';
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
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        DPSmallTextButton(
                            text: "스캐너",
                            onTap: () {
                              controller.scanCreditCard();
                            }),
                        const SizedBox(height: 32),
                        DPTextFormField(
                          controller: controller.cardNumberFieldController,
                          validator: controller.cardNumberValidator,
                          onChanged: (cardNumber) {
                            controller.cardNumber.value = cardNumber;
                          },
                          textInputAction: TextInputAction.next,
                          label: '카드 번호',
                          textInputType: TextInputType.number,
                          maxLength: 16,
                          hintText: '카드 번호 16자리를 입력해주세요',
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Flexible(
                              child: DPTextFormField(
                                controller: controller.expiredDateFieldController,
                                validator: controller.expiredDateValidator,
                                onChanged: (expiredDate) {
                                  controller.expiredDate.value = expiredDate;
                                },
                                textInputAction: TextInputAction.next,
                                label: '유효기간',
                                maxLength: 4,
                                textInputType: TextInputType.number,
                                hintText: 'MM/YY',
                              ),
                            ),
                            const SizedBox(width: 18),
                            Flexible(
                              child: DPTextFormField(
                                validator: controller.birthdayValidator,
                                onChanged: (birthday) {
                                  controller.birthday.value = birthday;
                                },
                                textInputAction: TextInputAction.next,
                                label: '생년 월일',
                                maxLength: 6,
                                textInputType: TextInputType.number,
                                hintText: '6자리로 입력',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        DPTextFormField(
                          validator: controller.passwordValidator,
                          onChanged: (password) {
                            controller.password.value = password;
                          },
                          textInputAction: TextInputAction.done,
                          onEditingComplete: controller.createGeneralCard,
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
            ),
            controller.obx(
                (_) => Obx(() => DPKeyboardReactiveButton(
                      disabled: !controller.buttonEnabled,
                      onTap: controller.buttonEnabled ? controller.createGeneralCard : null,
                      padding: const EdgeInsets.all(24),
                      child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    )),
                onLoading: const DPKeyboardReactiveButton(
                  disabled: true,
                  padding: EdgeInsets.all(24),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
