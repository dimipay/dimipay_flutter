import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({Key? key}) : super(key: key);
  final PaymentMethodsController paymentMethodsController = Get.find<PaymentMethodsController>();

  Widget _buildPaymentMethods(List<PaymentMethod> paymentMethods) {
    return Row(
      children: [
        for (PaymentMethod paymentMethod in paymentMethods)
          Row(
            children: [
              DPSmallCardPayment(
                title: paymentMethod.name ?? '',
                color: paymentMethod.color != null ? Color(int.parse('FF' + paymentMethod.color!, radix: 16)) : DPColors.MAIN_THEME,
              ),
              const SizedBox(width: 12),
            ],
          ),
      ],
    );
  }

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: paymentMethodsController.obx(
        (state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 32, height: 81),
                _buildPaymentMethods(state!),
                const SizedBox(width: 20),
              ],
            ),
          );
        },
        onLoading: Container(height: 81),
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
