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
          linkToRoute(Routes.PAYERROR),
          linkToRoute(Routes.EVENT),
          linkToRoute(Routes.PIN),
          linkToRoute(Routes.NOCONNECTION),
          linkToRoute(Routes.NOTIFICATION),
          linkToRoute(Routes.FACESIGN_INTRODUCE),
          linkToRoute(Routes.FACESIGN_DELETE),
          linkToRoute(Routes.ONBOARDING_REGISTERCARD),
          linkToRoute(Routes.ONBOARDING_AGREEMENT),
          linkToRoute(Routes.PRIVACYPOLICY),
          linkToRoute(Routes.TERMSOFSERVICE),
        ],
      ),
    );
  }
}
