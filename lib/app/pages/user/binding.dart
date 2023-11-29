import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/pages/user/controller.dart';
import 'package:get/get.dart';

class UserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => FaceSignController());
    Get.lazyPut(() => UserPageController());
    Get.lazyPut(() => PaymentMethodController());
  }
}
