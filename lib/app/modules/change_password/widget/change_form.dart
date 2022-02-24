import 'package:dimipay/app/modules/change_password/controller.dart';
import 'package:dimipay/app/modules/change_password/page.dart';
import 'package:dimipay/app/modules/change_password/widget/modified_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordForm extends Container {
  final controller = Get.find<ChangePasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                '보안을 위해 비밀번호를 변경해주세요',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
                '비밀번호가 초기 설정 이후 변경되지 않았거나 아이디와 똑같이 설정되어 있어요.',
              ),
              SizedBox(height: 16),
              Obx(
                () => CheckPassword(title: "현재 비밀번호", checked: controller.isSamePassword.value ? true : false),
              ),
              SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "변경한 비밀번호가 동일해요", checked: controller.isSameChangedPassword.value ? true : false),
              ),
              SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "숫자가 포함되어있어요", checked: controller.isNum.value ? true : false),
              ),
              SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "7자 이상이예요", checked: controller.isSevenOver.value ? true : false),
              ),
              SizedBox(height: 12),
              Obx(
                () => CheckPassword(title: "아이디와 동일하지 않아요", checked: controller.isNotSameId.value ? true : false),
              ),
              SizedBox(height: 12),
              SizedBox(height: 24),
              ModifiedDPTextField(
                label: "현재 비밀번호",
                isPassword: true,
                onChanged: (v) => controller.changePassword(v),
              ),
              SizedBox(height: 16),
              ModifiedDPTextField(
                label: "변경할 비밀번호",
                isPassword: true,
                onChanged: (v) => controller.changeChangedPassword(v),
              ),
              SizedBox(height: 16),
              ModifiedDPTextField(
                label: "한번 더 입력해주세요",
                isPassword: true,
                onChanged: (v) => controller.changeChangedPasswordOneMore(v),
              ),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
