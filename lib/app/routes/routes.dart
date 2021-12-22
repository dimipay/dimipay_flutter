import 'package:dimipay/app/ui/add_payment/manage_method.dart';
import 'package:dimipay/app/ui/card_fin/card_fin.dart';
import 'package:dimipay/app/ui/charging/ask_autocharge.dart';
import 'package:dimipay/app/ui/charging/charging_amount.dart';
import 'package:dimipay/app/ui/charging/charging_fin.dart';
import 'package:dimipay/app/ui/charging/select_charging_method.dart';
import 'package:dimipay/app/ui/edit_card_name.dart/edit_card_name.dart';
import 'package:dimipay/app/ui/mainpage/account_info.dart';
import 'package:dimipay/app/ui/mainpage/mainpage.dart';
import 'package:dimipay/app/ui/register_card/register_card.dart';
import 'package:dimipay/main.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const MAINPAGE = '/MainPage';
  static const ACCOUNTINFO = '/AccountInfo';
  static const MANAGEMETHOD = '/MainPage/ManageMethod';
  static const REGISTERCARD = '/RegisterCard';
  static const ASKAUTOCHARGE = '/AskAutoCharge';
  static const SELECTCHARGINGMETHOD = '/SelectChargingMethod';
  static const EDITCARDNAME = '/EditCardName';
  static const CARDFIN = '/CardFin';
  static const CHARGINGFIN = '/ChargingFin';
  static const CHARGINGAMOUNT = "/ChargingFin/ChargingAmount";
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Home()),
    GetPage(name: Routes.MAINPAGE, page: () => const MainPage()),
    GetPage(name: Routes.ACCOUNTINFO, page: () => const AccountInfoPage()),
    GetPage(name: Routes.MANAGEMETHOD, page: () => const ManageMethodPage()),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage()),
    GetPage(name: Routes.ASKAUTOCHARGE, page: () => const AskAutoChargePage()),
    GetPage(
        name: Routes.SELECTCHARGINGMETHOD,
        page: () => const SelectChargingMethodPage()),
    GetPage(name: Routes.EDITCARDNAME, page: () => EditCardNamePage()),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage()),
    GetPage(name: Routes.CHARGINGFIN, page: () => const ChargingFinPage()),
    GetPage(name: Routes.CHARGINGAMOUNT, page: () => ChargingAmountPage()),
  ];
}
