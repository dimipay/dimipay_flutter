import 'package:dimipay/app/core/middleware/login.dart';
import 'package:dimipay/app/core/middleware/onboarding.dart';
import 'package:dimipay/app/core/middleware/pin_auth.dart';
import 'package:dimipay/app/pages/card_fin/page.dart';
import 'package:dimipay/app/pages/edit_card/binding.dart';
import 'package:dimipay/app/pages/edit_card/page.dart';
import 'package:dimipay/app/pages/event/page.dart';
import 'package:dimipay/app/pages/event/binding.dart';
import 'package:dimipay/app/pages/facesign_delete/binding.dart';
import 'package:dimipay/app/pages/facesign_delete/page.dart';
import 'package:dimipay/app/pages/facesign_introduce/page.dart';
import 'package:dimipay/app/pages/facesign_tip1/page.dart';
import 'package:dimipay/app/pages/facesign_tip2/binding.dart';
import 'package:dimipay/app/pages/facesign_tip2/page.dart';
import 'package:dimipay/app/pages/history/binding.dart';
import 'package:dimipay/app/pages/history/page.dart';
import 'package:dimipay/app/pages/home/page.dart';
import 'package:dimipay/app/pages/home/binding.dart';
import 'package:dimipay/app/pages/login/binding.dart';
import 'package:dimipay/app/pages/login/page.dart';
import 'package:dimipay/app/pages/manage_method/binding.dart';
import 'package:dimipay/app/pages/manage_method/page.dart';
import 'package:dimipay/app/pages/no_connection/page.dart';
import 'package:dimipay/app/pages/notification/page.dart';
import 'package:dimipay/app/pages/onboarding_register_card/page.dart';
import 'package:dimipay/app/pages/onboarding_agreement/page.dart';
import 'package:dimipay/app/pages/pay/binding.dart';
import 'package:dimipay/app/pages/pay/page.dart';
import 'package:dimipay/app/pages/pay_pending/page.dart';
import 'package:dimipay/app/pages/pay_success/page.dart';
import 'package:dimipay/app/pages/pay_error/page.dart';
import 'package:dimipay/app/pages/pin/binding.dart';
import 'package:dimipay/app/pages/pin/page.dart';
import 'package:dimipay/app/pages/privacy_policy/page.dart';
import 'package:dimipay/app/pages/register_card/page.dart';
import 'package:dimipay/app/pages/register_card/binding.dart';
import 'package:dimipay/app/pages/terms_of_service/page.dart';
import 'package:dimipay/app/pages/test/page.dart';
import 'package:dimipay/app/pages/user/binding.dart';
import 'package:dimipay/app/pages/user/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.TEST, page: () => const TestPage()),
    GetPage(name: Routes.HOME, page: () => const HomePage(), binding: HomePageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.USER, page: () => UserPage(), binding: UserPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.MANAGEMETHOD, page: () => const ManageMethodPage(), binding: ManageMethodPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage(), binding: RegisterCardPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.EDITCARD, page: () => EditCardPage(), binding: EditCardPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
      PinAuthMiddleware(),
    ]),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.HISTORY, page: () => const HistoryPage(), binding: HistoryPageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.PAY, page: () => const PayPage(), binding: PayPageBinding(), middlewares: [
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
    GetPage(name: Routes.PIN, page: () => const PinPage(), binding: PinPageBinding(), middlewares: [
      LoginMiddleware(),
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
    GetPage(
      name: Routes.PAYERROR,
      page: () => PayErrorPage(),
      middlewares: [
        LoginMiddleware(),
        OnboardingMiddleware(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.NOCONNECTION, page: () => const NoConnectionPage(), transition: Transition.noTransition),
    GetPage(name: Routes.FACESIGN_INTRODUCE, page: () => const FaceSignIntroducePage(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.FACESIGN_DELETE, page: () => const FaceSignDeletePage(), binding: FaceSignDeletePageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.FACESIGN_TIP1, page: () => const FaceSignTip1Page(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.FACESIGN_TIP2, page: () => const FaceSignTip2Page(), binding: FaceSignTip2PageBinding(), middlewares: [
      LoginMiddleware(),
      OnboardingMiddleware(),
    ]),
    GetPage(name: Routes.ONBOARDING_REGISTERCARD, page: () => OnboardingRegisterCardPage()),
    GetPage(name: Routes.ONBOARDING_AGREEMENT, page: () => OnboardingAgreementPage()),
    GetPage(name: Routes.PRIVACYPOLICY, page: () => const PrivacyPolicyPage()),
    GetPage(name: Routes.TERMSOFSERVICE, page: () => const TermsOfServicePage()),
  ];
}
