import 'package:dimipay/app/core/middleware/login.dart';
import 'package:dimipay/app/core/middleware/onboarding.dart';
import 'package:dimipay/app/core/middleware/pin_auth.dart';
import 'package:dimipay/app/pages/face_sign/binding.dart';
import 'package:dimipay/app/pages/face_sign/page.dart';
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
import 'package:dimipay/app/pages/no_connection/page.dart';
import 'package:dimipay/app/pages/notification/page.dart';
import 'package:dimipay/app/pages/pay/binding.dart';
import 'package:dimipay/app/pages/pay/page.dart';
import 'package:dimipay/app/pages/pay_pending/page.dart';
import 'package:dimipay/app/pages/pay_success/page.dart';
import 'package:dimipay/app/pages/pin/binding.dart';
import 'package:dimipay/app/pages/pin/page.dart';
import 'package:dimipay/app/pages/printer_setting/page.dart';
import 'package:dimipay/app/pages/register_card/page.dart';
import 'package:dimipay/app/pages/register_card/binding.dart';
import 'package:dimipay/app/pages/test/page.dart';
import 'package:dimipay/app/pages/user/binding.dart';
import 'package:dimipay/app/pages/user/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.TEST, page: () => const TestPage()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomePageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.USER, page: () => UserPage(), binding: UserPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.MANAGEMETHOD, page: () => ManageMethodPage(), binding: ManageMethodPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage(), binding: RegisterCardPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.EDITCARD, page: () => EditCardNamePage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.COUPON, page: () => CouponPage(), binding: CouponPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.HISTORY, page: () => HistoryPage(), binding: HistoryPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.PAY, page: () => PayPage(), binding: PayPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.EVENT, page: () => EventPage(), binding: EventPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.NOTIFICATION, page: () => const NotificationPage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.ISSUECOUPON, page: () => const IssueCouponPage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.PIN, page: () => const PinPage(), binding: PinPageBinding(), middlewares: [
      LoginMiddleware(),
    ]),
    GetPage(name: Routes.FACESIGN, page: () => const FaceSignPage(), binding: FaceSignPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.PRINTERSETTING, page: () => const PrinterSettingPage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(
      name: Routes.PAYSUCCESS,
      page: () => PaySuccessPage(),
      middlewares: [
        LoginMiddleware(),
        OnboardingMiddleware(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PAYPENDING,
      page: () => PayPendingPage(),
      middlewares: [
        LoginMiddleware(),
        OnboardingMiddleware(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.NOCONNECTION, page: () => const NoConnectionPage()),
  ];
}
