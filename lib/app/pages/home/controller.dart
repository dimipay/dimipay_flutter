import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/notice/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/services/upgrader/service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final NoticeController noticeController = Get.find<NoticeController>();
  final EventController eventController = Get.find<EventController>();
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  final UpgraderService upgradeService = Get.find<UpgraderService>();

  var isLoading = false.obs;

  @override
  void onInit() {
    isLoading(true);
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.wait([
      paymentMethodController.fetchPaymentMethods(),
      noticeController.fetchNotices(),
      eventController.fetchEvents(),
    ]);
    isLoading(false);
  }
}
