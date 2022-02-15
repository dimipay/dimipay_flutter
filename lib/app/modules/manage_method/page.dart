import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ManageMethodPage extends StatefulWidget {
  const ManageMethodPage({Key? key}) : super(key: key);

  @override
  State<ManageMethodPage> createState() => _ManageMethodPageState();
}

class _ManageMethodPageState extends State<ManageMethodPage> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 수단'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text('실물카드', style: DPTextTheme.SECTION_HEADER),
            const SizedBox(height: 24),
            const DPRealCard(),
            const SizedBox(height: 24),
            Row(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      SvgPicture.asset('asset/images/change_card.svg'),
                      const SizedBox(width: 6),
                      const Text('카드 변경', style: DPTextTheme.REGULAR),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
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
            const SizedBox(height: 36),
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
    );
  }
}

class DPRealCard extends StatelessWidget {
  const DPRealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(118, 108, 98, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('카드결제', style: DPTextTheme.DESCRIPTION),
          SizedBox(height: 4),
          Text('국민카드', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
