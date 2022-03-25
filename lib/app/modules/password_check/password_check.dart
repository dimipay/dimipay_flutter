import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/modules/password_check/widget/password_field.dart';
import 'package:flutter/material.dart';

class PasswordCheckPage extends StatefulWidget {
  const PasswordCheckPage({Key? key}) : super(key: key);

  @override
  State<PasswordCheckPage> createState() => _PasswordCheckPageState();
}

class _PasswordCheckPageState extends State<PasswordCheckPage> {
  buildPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PasswordField(),
        const PasswordField(),
        const PasswordField(),
        const PasswordField(),
      ],
    );
  }

  buildNumberPad({List<List<int>>? nums}) {
    List<List<int>> nums = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [-1, 0, -1]
    ];

    return Center(
      child: SizedBox(
        width: 200,
        height: 300,
        child: Builder(builder: (context) {
          List<Row> rows = [];
          for (int i = 0; i < 4; i++) {
            List<Text> texts = [];

            for (int j = 0; j < 3; j++) {
              texts.add(Text(
                "${nums[i][j]}",
                style: const TextStyle(fontFamily: 'Pretendard', fontSize: 24, height: 1.2, color: DPColors.DARK1),
              ));
            }
            rows.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: texts,
            ));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rows,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "결제 비밀번호 입력",
                    style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 20, height: 1.2, color: DPColors.MAIN_THEME),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  buildPassword(),
                ],
              ),
              buildNumberPad()
            ],
          ),
        ),
      ),
    );
  }
}
