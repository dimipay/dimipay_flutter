import 'package:dimipay/app/ui/add_payment/add_payment.dart';
import 'package:dimipay/app/ui/mainpage/accountinfo.dart';
import 'package:dimipay/app/ui/mainpage/mainpage.dart';
import 'package:dimipay/main.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const MAINPAGE = '/MainPage';
  static const ACCOUNTINFO = '/AccountInfo';
  static const ADDPAYMENT = '/MainPage/AddPayment';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Home()),
    GetPage(name: Routes.MAINPAGE, page: () => const MainPage()),
    GetPage(name: Routes.ACCOUNTINFO, page: () => const AccountInfoPage()),
    GetPage(name: Routes.ADDPAYMENT, page: () => const AddPaymentPage()),
  ];
}
