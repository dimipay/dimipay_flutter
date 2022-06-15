import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/modules/payment_method/general/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/general/model.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/controller.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/divided_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ManageMethodPage extends StatelessWidget {
  final PrepaidCardController prepaidCardController = Get.find<PrepaidCardController>();
  final GeneralCardController generalCardController = Get.find<GeneralCardController>();

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
            const Text('등록된 카드가 없어요.', style: DPTextTheme.DESCRIPTION),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('asset/images/add.svg'),
                const SizedBox(width: 6),
                const Text('카드 등록', style: DPTextTheme.DESCRIPTION_IMPORTANT_COLOR),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _generalCard(GeneralCard card) {
    return Column(
      children: [
        GeneralCardWidget(card),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // GestureDetector(
            //   child: Row(
            //     children: [
            //       SvgPicture.asset('asset/images/change_card.svg'),
            //       const SizedBox(width: 6),
            //       const Text('카드 변경', style: DPTextTheme.REGULAR),
            //     ],
            //   ),
            // ),
            // const SizedBox(width: 24),
            GestureDetector(
              child: Row(
                children: [
                  SvgPicture.asset('asset/images/delete_card.svg'),
                  const SizedBox(width: 6),
                  const Text('카드 삭제', style: DPTextTheme.REGULAR),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _generalCardArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        const Text('실물카드', style: DPTextTheme.SECTION_HEADER),
        const SizedBox(height: 24),
        Obx(
          () {
            if (generalCardController.cards.value.isEmpty) {
              return _registerCardWidget();
            } else {
              return DividedColumn(
                divider: const SizedBox(height: 36),
                children: [for (var generalCard in generalCardController.cards.value) _generalCard(generalCard)],
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
        title: const Text('결제 수단'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _generalCardArea(),
              const Divider(height: 1, thickness: 1, color: DPColors.DARK6),
              const SizedBox(height: 36),
              const Text('페이머니', style: DPTextTheme.SECTION_HEADER),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('2,300원', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontWeight: FontWeight.bold, fontSize: 20, color: DPColors.MAIN_THEME)),
                  DPSmallButton(
                    child: Row(
                      children: [
                        SvgPicture.asset('asset/images/charge.svg'),
                        const SizedBox(width: 6),
                        const Text(
                          '충전',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.SELECTCHARGINGMETHOD);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '충전해둔 페이머니는 매점에서 현금처럼 사용할 수 있어요',
                style: DPTextTheme.DESCRIPTION,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GeneralCardWidget extends StatelessWidget {
  final GeneralCard card;
  const GeneralCardWidget(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: card.color != '' ? Color(int.parse('FF${card.color}', radix: 16)) : DPColors.MAIN_THEME,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('3510 ···· ···· ····', style: DPTextTheme.DESCRIPTION),
          const SizedBox(height: 4),
          Text(card.name, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
