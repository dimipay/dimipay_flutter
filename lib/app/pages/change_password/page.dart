import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/pages/change_password/widget/change_form.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ChangePasswordForm(),
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

class CheckPassword extends StatefulWidget {
  final bool checked;
  final String title;
  const CheckPassword({Key? key, required this.title, required this.checked}) : super(key: key);

  @override
  State<CheckPassword> createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.checked ? SvgPicture.asset("asset/images/check.svg") : SvgPicture.asset("asset/images/not_check.svg", color: const Color.fromRGBO(0, 0, 0, 0.4)),
        const SizedBox(width: 4),
        Text(
          widget.title,
          style: widget.checked ? const TextStyle(color: DPColors.MAIN_THEME, decoration: TextDecoration.underline, fontWeight: FontWeight.w600) : const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
        )
      ],
    );
  }
}
