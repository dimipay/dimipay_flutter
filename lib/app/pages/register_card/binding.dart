import 'package:dimipay/app/data/modules/register_card/controller.dart';
import 'package:dimipay/app/data/modules/register_card/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class RegisterCardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCardPageController>(() => RegisterCardPageController(RegisterCardRepository(ApiProvider())));
  }
}
