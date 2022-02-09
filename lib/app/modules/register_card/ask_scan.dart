import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/ui/mainpage/mainpage.dart';
import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskScanPage extends StatelessWidget {
  const AskScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "신용카드 또는 체크카드를 준비해주세요",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "스캔의 정확도를 높이기 위해 충분히 밝은 곳에서 스캔을 진행해주세요",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RotatedBox(quarterTurns: 3, child: DPRealCard()),
                ],
              ),
            ),
            DPBlackButton(text: "스캔"),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.REGISTERCARD);
              },
              child: const Text(
                "카드 정보를 직접 입력할게요",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
