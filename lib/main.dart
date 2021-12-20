import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route")),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.MAINPAGE);
            },
            child: const Text("MAINPAGE"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.ACCOUNTINFO);
            },
            child: const Text("ACCOUNTINFO"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.ADDPAYMENT);
            },
            child: const Text("ADDPAYMENT"),
          ),
        ],
      ),
    );
  }
}
