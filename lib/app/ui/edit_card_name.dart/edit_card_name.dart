import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditCardNamePage extends StatelessWidget {
  const EditCardNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '카드의 이름을 입력해주세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  DPPaymentCard(
                    color: const Color(0xFF766C62),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextField(
                              cursorColor: Colors.white,
                              style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                                hintText: '카드 이름',
                                hintStyle: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.4)),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('2158', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.6))),
                          ],
                        ),
                        SvgPicture.asset('asset/images/kb_logo.svg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '다음에 설정에서 바꿀게요',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset('asset/images/arrow_right_small.svg'),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: DPMediumTextButton(text: '다음', width: double.infinity),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
