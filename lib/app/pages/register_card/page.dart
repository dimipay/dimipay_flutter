import 'package:dimipay/app/pages/register_card/controller.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPage extends GetView<RegisterCardPageController> {
  const RegisterCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DPAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: controller.formKey,
                    child: FocusScope(
                      node: controller.formFocusScopeNode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            '카드의 기초 정보를 입력해주세요',
                            style: DPTextTheme.PAGE_HEADER,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '결제할 때 필요한 정보들이니 정확하게 입력해주세요',
                            style: DPTextTheme.DESCRIPTION,
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
                          const SizedBox(height: 16),
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
                              const SizedBox(width: 16),
                              Flexible(
                                child: DPTextFormField(
                                  enableInteractiveSelection: false,
                                  controller: controller.ownerPersonalNumFieldController,
                                  textInputType: TextInputType.number,
                                  label: '생년월일 / 사업자번호',
                                  hintText: '6 / 10자리',
                                  maxLength: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          DPTextFormField(
                            enableInteractiveSelection: false,
                            controller: controller.passwordFieldController,
                            textInputType: TextInputType.number,
                            isPassword: true,
                            label: '카드 비밀번호',
                            hintText: '앞 2자리',
                            maxLength: 2,
                          ),
                          const SizedBox(height: 24),
                          if (!GetPlatform.isWeb)
                            DPSmallTextButton(
                              text: "카드 스캔하기",
                              onTap: controller.scanCreditCard,
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
