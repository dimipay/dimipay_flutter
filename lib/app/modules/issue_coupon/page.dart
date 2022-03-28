import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class IssueCouponPage extends StatefulWidget {
  const IssueCouponPage({Key? key}) : super(key: key);

  @override
  State<IssueCouponPage> createState() => _IssueCouponPageState();
}

class _IssueCouponPageState extends State<IssueCouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('쿠폰 발급', style: DPTextTheme.PAGE_HEADER)),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "쿠폰은 매점에서 현금과 동일하게 사용할 수 있어요. 발급 내역은 내 정보 페이지의 결제기록에서 볼 수 있어요",
              style: DPTextTheme.REGULAR,
            ),
            const SizedBox(
              height: 24,
            ),
            const DPTextField(
              label: "수령할 학생",
              hintText: "학생의 학번 또는 이름을 입력해주세요",
            ),
            const SizedBox(
              height: 18,
            ),
            const DPTextField(
              label: "금액",
              hintText: "쿠폰의 금액을 입력해주세요",
            ),
            const SizedBox(
              height: 18,
            ),
            const DPTextField(
              label: "사유",
              hintText: "쿠폰 발급 사유를 입력해주세요",
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "발급사유는 학생이 확인할 수 있어요",
              style: DPTextTheme.DESCRIPTION,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "알림 전송",
              style: DPTextTheme.SECTION_HEADER,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "학생의 스마트폰으로 쿠폰이 발급되었다는 알림이 전송돼요",
                    style: DPTextTheme.DESCRIPTION,
                  ),
                ),
                const Switch(
                  value: true,
                  onChanged: null,
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
