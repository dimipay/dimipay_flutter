import 'package:dimipay/app/modules/card_fin/card_fin.dart';
import 'package:dimipay/app/modules/charging_amount/charging_amount.dart';
import 'package:dimipay/app/modules/coupon_list/coupon_list.dart';
import 'package:dimipay/app/modules/login/login.dart';
import 'package:dimipay/app/modules/register_card/register_card.dart';
import 'package:dimipay/app/modules/transaction_history/transaction_history.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/modules/manage_method/manage_method.dart';
import 'package:dimipay/app/modules/ask_auto_charge/ask_autocharge.dart';
import 'package:dimipay/app/modules/charging_fin/charging_fin.dart';
import 'package:dimipay/app/modules/select_charging_method/select_charging_method.dart';
import 'package:dimipay/app/modules/edit_card_name/edit_card_name.dart';
import 'package:dimipay/app/modules/change_password/change_password.dart';
import 'package:dimipay/app/modules/untitled/untitled.dart';
import 'package:dimipay/app/modules/account_info/account_info.dart';
import 'package:dimipay/app/modules/home/home_page.dart';
import 'package:dimipay/app/modules/add_payment/add_payment.dart';
import 'package:dimipay/main.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Home()),
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.ACCOUNTINFO, page: () => const AccountInfoPage()),
    GetPage(name: Routes.MANAGEMETHOD, page: () => const ManageMethodPage()),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage()),
    GetPage(name: Routes.ASKAUTOCHARGE, page: () => const AskAutoChargePage()),
    GetPage(name: Routes.SELECTCHARGINGMETHOD, page: () => const SelectChargingMethodPage()),
    GetPage(name: Routes.EDITCARDNAME, page: () => EditCardNamePage()),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage()),
    GetPage(name: Routes.CHARGINGFIN, page: () => const ChargingFinPage()),
    GetPage(name: Routes.CHARGINGAMOUNT, page: () => ChargingAmountPage()),
    GetPage(name: Routes.COUPONLIST, page: () => const CouponListPage()),
    GetPage(name: Routes.TRANSACTIONHISTORY, page: () => const TransactionHistoryPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.CHANGEPASSWORD, page: () => const ChangePasswordPage()),
    GetPage(name: Routes.UNTITLED, page: () => const Untitled()),
    GetPage(name: Routes.ADDPAYMENT, page: () => const AddPaymentPage()),
  ];
}
