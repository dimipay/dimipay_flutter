import 'package:dimipay/app/data/modules/payment_method/general/model.dart';
import 'package:dimipay/app/data/modules/payment_method/general/repository.dart';
import 'package:get/get.dart';

class GeneralCardController extends GetxController with StateMixin<List<GeneralCard>> {
  final GeneralCardRepository repository;
  GeneralCardController(this.repository);

  Rx<List<GeneralCard>> cards = Rx([]);

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
