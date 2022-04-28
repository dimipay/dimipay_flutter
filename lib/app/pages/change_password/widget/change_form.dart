import 'package:dimipay/app/pages/change_password/controller.dart';
import 'package:dimipay/app/pages/change_password/page.dart';
import 'package:dimipay/app/pages/change_password/widget/modified_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordForm extends Container {
  final controller = Get.find<ChangePasswordPageController>();

  ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                '보안을 위해 비밀번호를 변경해주세요',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                '비밀번호가 초기 설정 이후 변경되지 않았거나 아이디와 똑같이 설정되어 있어요.',
              ),
              const SizedBox(height: 16),
              Obx(
                () => CheckPassword(title: "숫자가 포함되어있어요", checked: controller.isNum.value ? true : false),
              ),
              const SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "7자 이상이예요", checked: controller.isSevenOver.value ? true : false),
              ),
              const SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "아이디와 동일하지 않아요", checked: controller.isNotSameId.value ? true : false),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 24),
              ModifiedDPTextField(
                label: "현재 비밀번호",
                isPassword: true,
                onChanged: controller.currentPasswordChanged,
                controller: controller.currentPasswordField,
              ),
              const SizedBox(height: 16),
              ModifiedDPTextField(
                label: "변경할 비밀번호",
                isPassword: true,
                onChanged: controller.newPasswordChanged,
                controller: controller.newPasswordField,
              ),
              const SizedBox(height: 16),
              ModifiedDPTextField(
                label: "한번 더 입력해주세요",
                isPassword: true,
                onChanged: controller.verifyNewPasswordChanged,
                controller: controller.verifyNewPasswordField,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
