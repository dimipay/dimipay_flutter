import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordPage extends StatelessWidget {
  final FocusNode textFieldFocusNode = FocusNode();
  static TextEditingController current = TextEditingController();
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "디미고 계정 비밀번호 변경",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '보안을 위해 비밀번호를 변경해주세요',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 18),
                      Text(
                        '비밀번호가 초기 설정 이후 변경되지 않았거나 아이디와 똑같이 설정되어 있어요.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 18),
                      CheckPassword(title: "숫자가 포함되어있어요", checked: true),
                      SizedBox(height: 12),
                      CheckPassword(title: "7자 이상이예요", checked: false),
                      SizedBox(height: 12),
                      CheckPassword(title: "아이디와 동일하지 않아요", checked: false),
                      SizedBox(height: 12),
                      SizedBox(height: 24),
                      DPTextField(
                        label: "현재 비밀번호",
                      ),
                      SizedBox(height: 16),
                      DPTextField(
                        label: "변경할 비밀번호",
                      ),
                      SizedBox(height: 16),
                      DPTextField(
                        label: "한번 더 입력해주세요",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DPMediumTextButton(
                text: '다음',
                width: double.infinity,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class CheckPassword extends StatefulWidget {
  final bool checked;
  final String title;
  const CheckPassword({Key? key, required this.title, required this.checked}) : super(key: key);

  @override
  _CheckPasswordState createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  @override
  Widget build(BuildContext context) {
    if (widget.checked) {
      return Row(
        children: [
          SvgPicture.asset("asset/images/check.svg"),
          const SizedBox(
            width: 4,
          ),
          Text(
            widget.title,
            style: const TextStyle(color: mainColor, decoration: TextDecoration.underline),
          )
        ],
      );
    } else {
      return Row(
        children: [
          SvgPicture.asset("asset/images/not_check.svg"),
          const SizedBox(
            width: 4,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
          )
        ],
      );
    }
  }
}
