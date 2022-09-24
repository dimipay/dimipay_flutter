import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/user/controller.dart';
import 'package:get/get.dart';

class UserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(UserRepository(ApiProvider())));
    Get.lazyPut<UserPageController>(() => UserPageController());
		Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(PaymentMethodRepository(ApiProvider())));
  }
}
