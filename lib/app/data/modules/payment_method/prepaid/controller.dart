import 'package:dimipay/app/data/modules/payment_method/prepaid/model.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/repository.dart';
import 'package:get/get.dart';

class PrepaidCardController extends GetxController with StateMixin<List<PrepaidCard>> {
  final PrepaidCardRepository repository;
  PrepaidCardController(this.repository);

  Rx<List<PrepaidCard>> cards = Rx([]);

  @override
  void onInit() {
    getGeneralCards();
    super.onInit();
  }

  Future getGeneralCards() async {
    change(null, status: RxStatus.loading());
    cards.value = await repository.get();
    change(cards.value, status: RxStatus.success());
  }
}
