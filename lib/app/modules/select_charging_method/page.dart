import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectChargingMethodPage extends StatelessWidget {
  const SelectChargingMethodPage({Key? key}) : super(key: key);

  Widget _simplePayMethodCard(String text, String imagePath) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: DPColors.DARK6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath),
              const SizedBox(height: 12),
              Text(text, style: DPTextTheme.REGULAR),
            ],
          ),
        ),
      ),
    );
  }

  Widget _simplaPayArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('간편 결제', style: DPTextTheme.DESCRIPTION),
        const SizedBox(height: 12),
        Row(
          children: [
            _simplePayMethodCard('카카오페이', 'asset/images/payment_kakao.png'),
            const SizedBox(width: 12),
            _simplePayMethodCard('토스결제', 'asset/images/payment_toss.png'),
            const SizedBox(width: 12),
            _simplePayMethodCard('네이버페이', 'asset/images/payment_toss.png'),
          ],
        )
      ],
    );
  }

  Widget _standardPayMethodItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: DPTextTheme.REGULAR),
                const SizedBox(height: 4),
                Text(description, style: DPTextTheme.DESCRIPTION),
              ],
            ),
          ),
          const SizedBox(width: 64),
          SvgPicture.asset('asset/images/arrow_right_6.svg'),
        ],
      ),
    );
  }

  Widget _standardPayArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('일반결제', style: DPTextTheme.DESCRIPTION),
        const SizedBox(height: 12),
        _standardPayMethodItem('통장 등록', '결제할 때 마다 통장에서 돈이 빠져나가요'),
        _standardPayMethodItem('입금', '디미페이의 계좌로 송금해서 포인트 잔액을 충전해요'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('어떻게 충전할까요?', style: DPTextTheme.SECTION_HEADER),
                      const SizedBox(height: 36),
                      _simplaPayArea(),
                      const SizedBox(height: 36),
                      _standardPayArea(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: DPCard(
                  isHighlighted: true,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '이전에 사용했던 결제수단이예요',
                        style: DPTextTheme.DESCRIPTION,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Image.asset("asset/images/payment_kakao.png"),
                          const SizedBox(width: 6),
                          const Text(
                            "네이버페이로 충전하기",
                            style: DPTextTheme.REGULAR,
                          )
                        ],
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
