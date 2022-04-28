import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingAmountPage extends StatelessWidget {
  final FocusNode textFieldFocusNode = FocusNode();
  ChargingAmountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  children: [
                    const Text(
                      '얼마나 충전할까요',
                      style: DPTextTheme.SECTION_HEADER,
                    ),
                    const SizedBox(height: 6),
                    const Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(text: "현재 잔액 ", style: DPTextTheme.REGULAR),
                      TextSpan(
                        text: "3,700원",
                        style: DPTextTheme.REGULAR_IMPORTANT,
                      )
                    ])),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        textFieldFocusNode.requestFocus();
                      },
                      child: const DPTextField(
                        textInputType: TextInputType.number,
                        label: "충전 금액",
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            DPKeyboardReactiveButton(
              onTap: () {
                Get.offNamed(Routes.CHARGINGFIN);
              },
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
