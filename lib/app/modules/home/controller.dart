import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/data/models/payment_method.dart';
import 'package:dimipay/app/modules/home/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<List<Notice>?> {
  final NoticeRepository repository;
  NoticeController(this.repository);
  Rx<List<Notice>?> notices = Rx(null);

  @override
  void onInit() {
    getNotice();
    super.onInit();
  }

  Future getNotice() async {
    change(null, status: RxStatus.loading());
    notices.value = await repository.get();
    change(notices.value, status: RxStatus.success());
  }
}

class PaymentMethodsController extends GetxController with StateMixin<List<PaymentMethod>?> {
  final PaymentMethodRepository repository;
  PaymentMethodsController(this.repository);
  Rx<List<PaymentMethod>?> paymentMethods = Rx(null);

  @override
  void onInit() {
    getPaymentMethods();
    super.onInit();
  }

  Future getPaymentMethods() async {
    change(null, status: RxStatus.loading());
    paymentMethods.value = await repository.get();
    change(paymentMethods.value, status: RxStatus.success());
  }
}
