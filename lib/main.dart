import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/routes/pages.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routes.TEST,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: DPColors.DARK1,
          centerTitle: false,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              Get.toNamed(Routes.SELECTCHARGINGMETHOD);
            },
            child: const Text("SELECTCHARGINGMETHOD"),
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
              Get.toNamed(Routes.CHARGINGFIN);
            },
            child: const Text("CHARGINGFIN"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.CHARGINGAMOUNT);
            },
            child: const Text("CHARGINGAMOUNT"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.COUPONLIST);
            },
            child: const Text('COUPONLIST'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.TRANSACTIONHISTORY);
            },
            child: const Text('TRANSACTIONHISTORY'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: const Text('LOGIN'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.CHANGEPASSWORD);
            },
            child: const Text('CHANGEPASSWORD'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.UNTITLED);
            },
            child: const Text('UNTITLED'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EXPERIMENT);
            },
            child: const Text('EXPERIMENT'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.TRANSACTION);
            },
            child: const Text('TRANSACTION'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EVENT);
            },
            child: const Text('EVENT'),
          ),
        ],
      ),
    );
  }
}
