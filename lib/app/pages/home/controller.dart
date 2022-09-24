import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/notice/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final NoticeController noticeController = Get.find<NoticeController>();
  final EventController eventController = Get.find<EventController>();
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  @override
  void onInit() {
    paymentMethodController.fetchPaymentMethods();
    noticeController.fetchNotices();
    super.onInit();
  }
}
