import 'package:dimipay/app/data/modules/payment_method/general/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/general/repository.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class ManageMethodPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrepaidCardController>(() => PrepaidCardController(PrepaidCardRepository(ApiProvider())));
    Get.lazyPut<GeneralCardController>(() => GeneralCardController(GeneralCardRepository(ApiProvider())));
  }
}
