import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:dimipay/app/pages/transaction/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class TransactionPage extends GetView<TransactionPageController> {
  TransactionPage({Key? key}) : super(key: key);
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: controller.obx(
        (state) => Obx(
          () {
            return SizedBox(
              height: 81,
              child: CarouselSlider(
                items: paymentMethodController.paymentMethods!
                    .map(
                      (paymentMethod) => DPSmallCardPayment(
                        title: paymentMethod.name ?? '',
                        color: paymentMethod.color?.isEmpty ?? true ? DPColors.MAIN_THEME : Color(int.parse('FF${paymentMethod.color}', radix: 16)),
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
                  onPageChanged: (index, carouselPageChangedReason) => controller.onPaymentMethodChanged(index),
                ),
              ),
            );
          },
        ),
        onLoading: const SizedBox(height: 81),
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
                    Obx(
                      () {
                        if (controller.paymentToken.value == null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Shimmer.fromColors(
                              period: const Duration(seconds: 1),
                              baseColor: const Color.fromARGB(255, 232, 232, 232),
                              highlightColor: const Color.fromARGB(255, 250, 250, 250),
                              child: Container(
                                width: 240,
                                height: 240,
                                color: Colors.black,
                              ),
                            ),
                          );
                        } else {
                          return QrImage(
                            data: controller.paymentToken.value!,
                            version: 4,
                            size: 240.0,
                          );
                        }
                      },
                    ),
                    // const SizedBox(height: 36),
                    // const Text('결제단말기로 정보무늬를 읽어주세요', style: DPTextTheme.DESCRIPTION_IMPORTANT),
                    // const SizedBox(height: 6),
                    // const Text('위 정보무늬의 사용 권한은 계정 소유주로 한정됩니다.', style: DPTextTheme.DESCRIPTION),
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
