import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/pages/manage_method/controller.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:dimipay/app/widgets/divided_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ManageMethodPage extends GetView<ManageMethodPageController> {
  const ManageMethodPage({Key? key}) : super(key: key);

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

  Widget _buildCards() {
    return Obx(
      () => DividedColumn(
        divider: const SizedBox(height: 36),
        children: [
          for (var paymentMethod in controller.paymentMethodController.paymentMethods!)
            Column(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.EDITCARD, arguments: {'paymentMethod': paymentMethod}),
                  child: DPCard(
                    cardName: paymentMethod.name ?? "",
                    cardNumber: paymentMethod.last4Digit,
                    color: paymentMethod.color?.isEmpty ?? true ? DPColors.MAIN_THEME : Color(int.parse('FF${paymentMethod.color}', radix: 16)),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
        ],
      ),
    );
  }

  Widget _cardsArea() {
    return controller.paymentMethodController.obx(
      (paymentMethods) => Column(
        children: [
          _registerCardWidget(),
          const SizedBox(height: 36),
          _buildCards(),
        ],
      ),
      onLoading: Container(),
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
          await controller.paymentMethodController.fetchPaymentMethods();
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
                const SizedBox(height: 24),
                _cardsArea(),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
