import 'package:dimipay/app/pages/login/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends GetView<LoginPageController> {
  final FocusNode textFieldFocusNode = FocusNode();
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("디미고 계정으로 로그인"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '디미고라이프, 디미고인에서 사용하는 계정으로 로그인 해주세요',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      DPTextFormField(
                        label: "ID",
                        validator: controller.usernameValidator,
                        onChanged: (username) {
                          controller.username.value = username;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      DPTextFormField(
                        label: "비밀번호",
                        isPassword: true,
                        validator: controller.passwordValidator,
                        onEditingComplete: controller.login,
                        textInputAction: TextInputAction.done,
                        onChanged: (password) {
                          controller.password.value = password;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            controller.obx(
              (_) => Obx(
                () => DPKeyboardReactiveButton(
                  disabled: !controller.buttonEnabled,
                  onTap: controller.buttonEnabled ? controller.login : null,
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              onLoading: const DPKeyboardReactiveButton(
                disabled: true,
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
