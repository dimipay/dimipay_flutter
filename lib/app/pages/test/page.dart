import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            child: const Text("HOME"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.USER);
            },
            child: const Text('ACCOUNTINFO'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.MANAGEMETHOD);
            },
            child: const Text("MANAGEMETHOD"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.REGISTERCARD);
            },
            child: const Text("REGISTERCARD"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EDITCARDNAME);
            },
            child: const Text("EDITCARDNAME"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.CARDFIN);
            },
            child: const Text("CARDFIN"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.COUPON);
            },
            child: const Text('COUPONLIST'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.HISTORY);
            },
            child: const Text('TRANSACTIONHISTORY'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PAY);
            },
            child: const Text('PAY'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EVENT);
            },
            child: const Text('EVENT'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.ISSUECOUPON);
            },
            child: const Text('ISSUECOUPON'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PIN);
            },
            child: const Text('PINAUTH'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.BIOMETRICAUTH);
            },
            child: const Text('BiometricAuthPage'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PRINTERSETTING);
            },
            child: const Text('PRINTERSETTING'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PAYSUCCESS);
            },
            child: const Text('PAYSUCCESS'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PAYPENDING);
            },
            child: const Text('PAYPENDING'),
          ),
          TextButton(
            onPressed: () {
              Get.dialog(
                DPDialog(
                  title: "비밀번호가 취약해요",
                  content: "비밀번호가 아이디와 똑같이 설정되어 있어요. 디미페이를 사용하려면 비밀번호를 변경해야 해요.",
                  actions: [
                    DPDialogAction(title: '설정하기', isHighlighted: true),
                  ],
                ),
              );
            },
            child: const Text('DIALOG'),
          ),
        ],
      ),
    );
  }
}
