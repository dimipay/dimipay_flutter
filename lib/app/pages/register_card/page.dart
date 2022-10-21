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
      appBar: AppBar(title: const Text('카드 등록하기')),
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
                    child: FocusScope(
                      node: controller.formFocusScopeNode,
                      child: Column(
                        children: [
                          if (!GetPlatform.isWeb)
                            DPSmallTextButton(
                              text: "스캐너",
                              onTap: controller.scanCreditCard,
                            ),
                          const SizedBox(height: 32),
                          DPTextFormField(
                            enableInteractiveSelection: false,
                            controller: controller.cardNumberFieldController,
                            textInputType: TextInputType.number,
                            label: '카드 번호',
                            hintText: '0000-0000-0000-0000',
                            maxLength: 19,
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Flexible(
                                child: DPTextFormField(
                                  enableInteractiveSelection: false,
                                  controller: controller.expiredDateFieldController,
                                  textInputType: TextInputType.number,
                                  label: '유효기간',
                                  hintText: 'MM/YY',
                                  maxLength: 5,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Flexible(
                                child: DPTextFormField(
                                  enableInteractiveSelection: false,
                                  controller: controller.birthdayFieldController,
                                  textInputType: TextInputType.number,
                                  label: '생년 월일',
                                  hintText: '6자리',
                                  maxLength: 6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          DPTextFormField(
                            enableInteractiveSelection: false,
                            controller: controller.passwordFieldController,
                            textInputType: TextInputType.number,
                            isPassword: true,
                            label: '카드 비밀번호',
                            hintText: '앞 2자리',
                            maxLength: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            controller.obx(
              (_) => Obx(
                () => DPKeyboardReactiveButton(
                  disabled: !controller.inputValidity,
                  onTap: controller.createGeneralCard,
                  padding: const EdgeInsets.all(24),
                  child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              onLoading: const DPKeyboardReactiveButton(
                disabled: true,
                padding: EdgeInsets.all(24),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
