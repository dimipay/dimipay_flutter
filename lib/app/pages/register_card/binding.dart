import 'package:dimipay/app/data/modules/manage_method/controller.dart';
import 'package:dimipay/app/data/modules/manage_method/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class RegisterCardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMethodController>(() => ManageMethodController(ManageMethodRepository(ApiProvider())));
  }
}
