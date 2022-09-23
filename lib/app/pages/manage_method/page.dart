import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/divided_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ManageMethodPage extends StatelessWidget {
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  ManageMethodPage({Key? key}) : super(key: key);

  Widget _registerCardWidget() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.REGISTERCARD),
      child: Container(
        decoration: BoxDecoration(
          color: DPColors.DARK6,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                if (paymentMethodController.paymentMethods?.isEmpty == null) {
                  return Column(
                    children: const [
                      Text('등록된 카드가 없어요.', style: DPTextTheme.DESCRIPTION),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            Row(
              children: [
                SvgPicture.asset('asset/images/add.svg', width: 18),
                const SizedBox(width: 6),
                const Text('카드 등록', style: DPTextTheme.DESCRIPTION_IMPORTANT_COLOR),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _generalCard(PaymentMethod paymentMethod) {
    return Column(
      children: [
        GeneralCardWidget(
          paymentMethod,
          onTap: () => Get.toNamed(Routes.EDITCARD, arguments: {'paymentMethod': paymentMethod}),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _generalCardArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Obx(
          () {
            if (paymentMethodController.paymentMethods == null) {
              return Container();
            } else {
              return Column(
                children: [
                  _registerCardWidget(),
                  const SizedBox(height: 36),
                  DividedColumn(
                    divider: const SizedBox(height: 36),
                    children: [for (var generalCard in paymentMethodController.paymentMethods!) _generalCard(generalCard)],
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 36),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카드'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          HapticHelper.feedback(HapticPatterns.once);
          await paymentMethodController.fetchPaymentMethods();
          HapticHelper.feedback(HapticPatterns.once);
        },
        color: DPColors.MAIN_THEME,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _generalCardArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GeneralCardWidget extends StatelessWidget {
  final PaymentMethod card;
  final void Function()? onTap;
  const GeneralCardWidget(this.card, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: card.color?.isEmpty ?? true ? DPColors.MAIN_THEME : Color(int.parse('FF${card.color}', radix: 16)),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(card.name ?? '', style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
