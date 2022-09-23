import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:get/get.dart';

class ManageMethodPageController extends GetxController {
  Future<void> deletePaymentMethod(PaymentMethod paymentMethodPaymentMethod paymentMethod) async {
    PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
    await paymentMethodController.deleteGeneralCard(paymentMethod);
    DPSnackBar.open('카드를 삭제했어요', hapticFeedback: HapticPatterns.success);
  }
}
