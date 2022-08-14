import 'package:dimipay/app/core/middleware/login_page.dart';
import 'package:dimipay/app/core/middleware/pin_page.dart';
import 'package:dimipay/app/pages/biometric_auth/page.dart';
import 'package:dimipay/app/pages/card_fin/page.dart';
import 'package:dimipay/app/pages/coupon/page.dart';
import 'package:dimipay/app/pages/coupon/binding.dart';
import 'package:dimipay/app/pages/edit_card_name/page.dart';
import 'package:dimipay/app/pages/event/page.dart';
import 'package:dimipay/app/pages/event/binding.dart';
import 'package:dimipay/app/pages/history/binding.dart';
import 'package:dimipay/app/pages/history/page.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:dimipay/app/pages/home/binding.dart';
import 'package:dimipay/app/pages/issue_coupon/page.dart';
import 'package:dimipay/app/pages/login/binding.dart';
import 'package:dimipay/app/pages/login/page.dart';
import 'package:dimipay/app/pages/manage_method/binding.dart';
import 'package:dimipay/app/pages/manage_method/page.dart';
import 'package:dimipay/app/pages/notification/page.dart';
import 'package:dimipay/app/pages/pin/binding.dart';
import 'package:dimipay/app/pages/pin/page.dart';
import 'package:dimipay/app/pages/printer_setting/page.dart';
import 'package:dimipay/app/pages/register_card/page.dart';
import 'package:dimipay/app/pages/register_card/binding.dart';
import 'package:dimipay/app/pages/test/page.dart';
import 'package:dimipay/app/pages/transaction/binding.dart';
import 'package:dimipay/app/pages/transaction/page.dart';
import 'package:dimipay/app/pages/transaction_fin/page.dart';
import 'package:dimipay/app/pages/user/binding.dart';
import 'package:dimipay/app/pages/user/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.TEST, page: () => const TestPage()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomePageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.USER, page: () => UserPage(), binding: UserPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.MANAGEMETHOD, page: () => ManageMethodPage(), binding: ManageMethodPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage(), binding: RegisterCardPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.EDITCARDNAME, page: () => EditCardNamePage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.COUPON, page: () => CouponPage(), binding: CouponPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.HISTORY, page: () => HistoryPage(), binding: HistoryPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.TRANSACTION, page: () => TransactionPage(), binding: TransactionPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.EVENT, page: () => EventPage(), binding: EventPageBinding(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.NOTIFICATION, page: () => const NotificationPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.ISSUECOUPON, page: () => const IssueCouponPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.PIN, page: () => const PinPage(), binding: PinPageBinding(), middlewares: [
      LoginPageMiddleware(),
    ]),
    GetPage(name: Routes.BIOMETRICAUTH, page: () => const BiometricAuthPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.PRINTERSETTING, page: () => const PrinterSettingPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.TRANSACTIONFIN, page: () => TransactionFinPage(), middlewares: [
      LoginPageMiddleware(),
      PinPageMiddleware(),
    ]),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginPageBinding()),
  ];
}
