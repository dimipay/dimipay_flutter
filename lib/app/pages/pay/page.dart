import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:dimipay/app/pages/pay/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class PayPage extends GetView<PayPageController> {
  const PayPage({Key? key}) : super(key: key);

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
                items: controller.paymentMethodController.paymentMethods!
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
                  scrollPhysics: const AlwaysScrollableScrollPhysics(),
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
                    controller.obx(
                      (_) => Obx(
                        () => QrImage(
                          data: controller.paymentToken.value!,
                          size: 200,
                          version: 1,
                        ),
                      ),
                      onLoading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Shimmer.fromColors(
                          period: const Duration(seconds: 1),
                          baseColor: const Color.fromARGB(255, 232, 232, 232),
                          highlightColor: const Color.fromARGB(255, 250, 250, 250),
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
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
