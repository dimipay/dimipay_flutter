import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/initializer.dart';
import 'package:dimipay/app/routes/pages.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

String getInintialRoute({bool debug = false}) {
  return debug ? Routes.TEST : Routes.HOME;
}

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppInitializer().init();
  FlutterNativeSplash.remove();
  runApp(
    GetMaterialApp(
      title: '디미페이',
      initialRoute: getInintialRoute(debug: true),
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
