import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/modules/password_check/widget/numberpad_item.dart';
import 'package:dimipay/app/modules/password_check/widget/password_field.dart';
import 'package:flutter/material.dart';

class PinAuthPage extends StatelessWidget {
  const PinAuthPage({Key? key}) : super(key: key);

  buildPassword() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        PasswordField(),
        SizedBox(width: 16),
        PasswordField(),
        SizedBox(width: 16),
        PasswordField(),
        SizedBox(width: 16),
        PasswordField(),
      ],
    );
  }

  buildNumberPad({List<List<int>>? nums}) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                const Expanded(
                  child: NumberPadItem(
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 30, color: DPColors.DARK1),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "결제 비밀번호 입력",
                      style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 24, height: 1.2, color: DPColors.MAIN_THEME),
                    ),
                    const SizedBox(height: 24),
                    buildPassword(),
                  ],
                ),
              ),
              buildNumberPad(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
