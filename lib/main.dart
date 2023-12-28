import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/loader.dart';
import 'package:dimipay/app/routes/pages.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
  await AppLoader().load();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FlutterNativeSplash.remove();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    GetMaterialApp(
      title: '디미페이',
      initialRoute: getInintialRoute(debug: false),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Pretendard',
        primaryColor: DPColors.MAIN_THEME,
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
