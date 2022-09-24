import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  Widget linkToRoute(String route) {
    return TextButton(
      onPressed: () {
        Get.toNamed(route);
      },
      child: Text(route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          linkToRoute(Routes.HOME),
          linkToRoute(Routes.LOGIN),
          linkToRoute(Routes.USER),
          linkToRoute(Routes.MANAGEMETHOD),
          linkToRoute(Routes.REGISTERCARD),
          linkToRoute(Routes.EDITCARD),
          linkToRoute(Routes.CARDFIN),
          linkToRoute(Routes.HISTORY),
          linkToRoute(Routes.PAY),
          linkToRoute(Routes.PAYPENDING),
          linkToRoute(Routes.PAYSUCCESS),
          linkToRoute(Routes.EVENT),
          linkToRoute(Routes.PIN),
          linkToRoute(Routes.NOCONNECTION),
          linkToRoute(Routes.NOTIFICATION),
          linkToRoute(Routes.COUPON),
          linkToRoute(Routes.ISSUECOUPON),
        ],
      ),
    );
  }
}
