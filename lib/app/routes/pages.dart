import 'package:dimipay/app/modules/account_info/binding.dart';
import 'package:dimipay/app/modules/card_fin/page.dart';
import 'package:dimipay/app/modules/change_password/binding.dart';
import 'package:dimipay/app/modules/charging_amount/page.dart';
import 'package:dimipay/app/modules/coupon_list/page.dart';
import 'package:dimipay/app/modules/event/page.dart';
import 'package:dimipay/app/modules/experiment/page.dart';
import 'package:dimipay/app/modules/login/binding.dart';
import 'package:dimipay/app/modules/login/page.dart';
import 'package:dimipay/app/modules/register_card/binding.dart';
import 'package:dimipay/app/modules/register_card/page.dart';
import 'package:dimipay/app/modules/splash/binding.dart';
import 'package:dimipay/app/modules/splash/page.dart';
import 'package:dimipay/app/modules/transaction/page.dart';
import 'package:dimipay/app/modules/transaction_history/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/modules/manage_method/page.dart';
import 'package:dimipay/app/modules/charging_fin/page.dart';
import 'package:dimipay/app/modules/select_charging_method/page.dart';
import 'package:dimipay/app/modules/edit_card_name/page.dart';
import 'package:dimipay/app/modules/change_password/page.dart';
import 'package:dimipay/app/modules/untitled/page.dart';
import 'package:dimipay/app/modules/account_info/page.dart';
import 'package:dimipay/app/modules/home/page.dart';
import 'package:dimipay/main.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.TEST, page: () => const Home()),
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.ACCOUNTINFO, page: () => AccountInfoPage(), binding: AccountInfoPageBinding()),
    GetPage(name: Routes.MANAGEMETHOD, page: () => const ManageMethodPage()),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage(), binding: RegisterCardPageBinding()),
    GetPage(name: Routes.SELECTCHARGINGMETHOD, page: () => const SelectChargingMethodPage()),
    GetPage(name: Routes.EDITCARDNAME, page: () => EditCardNamePage()),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage()),
    GetPage(name: Routes.CHARGINGFIN, page: () => const ChargingFinPage()),
    GetPage(name: Routes.CHARGINGAMOUNT, page: () => ChargingAmountPage()),
    GetPage(name: Routes.COUPONLIST, page: () => const CouponListPage()),
    GetPage(name: Routes.TRANSACTIONHISTORY, page: () => const TransactionHistoryPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.CHANGEPASSWORD, page: () => const ChangePasswordPage(), binding: ChangePasswordPageBinding()),
    GetPage(name: Routes.UNTITLED, page: () => const Untitled()),
    GetPage(name: Routes.EXPERIMENT, page: () => const ExperimentPage()),
    GetPage(name: Routes.TRANSACTION, page: () => const TransactionPage()),
    GetPage(name: Routes.EVENT, page: () => const EventPage()),
    GetPage(name: Routes.SPLASH, page: () => const SplashPage(), binding: SplashPageBinding()),
  ];
}
