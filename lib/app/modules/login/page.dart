import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '디미고라이프, 디미고인에서 사용하는 계정으로 로그인 해주세요',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    DPTextField(label: "ID"),
                    SizedBox(height: 16),
                    DPTextField(label: "비밀번호", isPassword: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            DPKeyboardReactiveButton(
              onTap: () {},
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
