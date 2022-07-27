import 'package:dimipay/app/pages/login/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
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
            DPLargeTextButton(
              text: "구글 계정으로 로그인",
              onTap: controller.loginWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}
