import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:dimipay/app/pages/transaction/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TransactionPage extends GetView<TransactionPageController> {
  const TransactionPage({Key? key}) : super(key: key);

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Obx(
        () => SizedBox(
          height: 81,
          child: CarouselSlider(
            items: controller.paymentMethods
                .map(
                  (paymentMethod) => DPSmallCardPayment(
                    title: paymentMethod.name,
                    color: paymentMethod.color != '' ? Color(int.parse('FF${paymentMethod.color}', radix: 16)) : DPColors.MAIN_THEME,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 81,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              viewportFraction: 0.45,
              initialPage: controller.currentIndex,
              onPageChanged: (index, carouselPageChangedReason) {
                controller.paymentMethodId.value = controller.paymentMethods[index].systemId;
                HapticHelper.feedback(HapticPatterns.once);
              },
            ),
          ),
        ),
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
