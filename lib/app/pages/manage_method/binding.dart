import 'package:dimipay/app/data/modules/manage_method/controller.dart';
import 'package:dimipay/app/data/modules/manage_method/repository.dart';
import 'package:dimipay/app/data/modules/payment_method/general/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/general/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class ManageMethodPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneralCardController>(() => GeneralCardController(GeneralCardRepository(ApiProvider())));
    Get.lazyPut<ManageMethodController>(() => ManageMethodController(ManageMethodRepository(ApiProvider())));
  }
}
