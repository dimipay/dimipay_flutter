// ignore_for_file: constant_identifier_names

import 'package:dimipay/app/ui/card_fin/card_fin.dart';
import 'package:dimipay/app/ui/mainpage/account_info.dart';
import 'package:dimipay/app/ui/mainpage/mainpage.dart';
import 'package:dimipay/app/ui/notification/notifications.dart';
import 'package:dimipay/app/ui/register_card/ask_scan.dart';
import 'package:dimipay/app/ui/register_card/register_card.dart';
import 'package:dimipay/main.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const MAINPAGE = '/MainPage';
  static const ACCOUNTINFO = '/MainPage/AccountInfo';
  static const MANAGEMETHOD = '/MainPage/ManageMethod';
  static const REGISTERCARD = '/RegisterCard';
  static const ASKAUTOCHARGE = '/AskAutoCharge';
  static const SELECTCHARGINGMETHOD = '/SelectChargingMethod';
  static const EDITCARDNAME = '/EditCardName';
  static const CARDFIN = '/CardFin';
  static const CHARGINGFIN = '/ChargingFin';
  static const CHARGINGAMOUNT = "/ChargingFin/ChargingAmount";
  static const COUPONLIST = "/CouponList";
  static const TRANSACTIONHISTORY = '/TransactionHistory';
  static const LOGIN = "/login";
  static const CHANGEPASSWORD = "/ChangePassword";
  static const UNTITLED = "/Untitled";
  static const NOTIFICATION = "/MainPage/Notification";
  static const ASKSCAN = "/AskScan";
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Home()),
    GetPage(name: Routes.MAINPAGE, page: () => const MainPage()),
    GetPage(name: Routes.NOTIFICATION, page: () => const NotificationPage()),
    GetPage(name: Routes.ACCOUNTINFO, page: () => const AccountInfoPage()),
    GetPage(name: Routes.ASKSCAN, page: () => const AskScanPage()),
    GetPage(name: Routes.REGISTERCARD, page: () => const RegisterCardPage()),
    GetPage(name: Routes.CARDFIN, page: () => const CardFinPage()),
  ];
}
