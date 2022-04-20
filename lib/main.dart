import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/initializer.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/pages.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

String getInintialRoute({bool debug = false}) {
  if (debug) {
    return Routes.TEST;
  }
  if (Get.find<AuthService>().token == '') {
    return Routes.LOGIN;
  } else {
    return Routes.HOME;
  }
}

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppInitializer().init();
  FlutterNativeSplash.remove();
  runApp(
    GetMaterialApp(
      initialRoute: getInintialRoute(),
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
              Get.toNamed(Routes.COUPON);
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
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.ISSUECOUPON);
            },
            child: const Text('ISSUECOUPON'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.PINAUTH);
            },
            child: const Text('PINAUTH'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.BIOMETRICAUTH);
            },
            child: const Text('BIOMETRICAUTH'),
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
