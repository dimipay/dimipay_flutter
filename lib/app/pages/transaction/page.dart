import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 32),
                DPSmallCardPayment(title: '국민카드', subtitle: '카드결제', color: Color.fromRGBO(118, 108, 98, 1)),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '페이머니로 결제', subtitle: '잔액 3,600원', color: DPColors.MAIN_THEME),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '쿠폰만 쓰기', color: DPColors.DARK2),
                SizedBox(width: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DPColors.DARK6,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImage(
                      data: "8801037055726",
                      version: 4,
                      size: 240.0,
                    ),
                    const SizedBox(height: 36),
                    const Text('결제단말기로 정보무늬를 읽어주세요', style: DPTextTheme.DESCRIPTION_IMPORTANT),
                    const SizedBox(height: 6),
                    const Text('위 정보무늬의 사용 권한은 계정 소유주로 한정됩니다.', style: DPTextTheme.DESCRIPTION),
                  ],
                ),
              ),
              _paymentsArea(),
            ],
          ),
        ),
      ),
    );
  }
}
