import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

class PasswordCheckPage extends StatefulWidget {
  const PasswordCheckPage({Key? key}) : super(key: key);

  @override
  State<PasswordCheckPage> createState() => _PasswordCheckPageState();
}

class _PasswordCheckPageState extends State<PasswordCheckPage> {
  buildPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [Text("0"), Text("0"), Text("0"), Text("0")],
    );
  }

  buildNumberPad() {
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
            rows.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("${nums[i][0]}"), Text("${nums[i][1]}"), Text("${nums[i][2]}")],
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "결제 비밀번호 입력",
              ),
              const SizedBox(
                height: 24,
              ),
              buildPassword(),
              const SizedBox(
                height: 24,
              ),
              buildNumberPad()
            ],
          ),
        ),
      ),
    );
  }
}
