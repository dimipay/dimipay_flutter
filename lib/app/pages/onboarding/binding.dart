import 'package:dimipay/app/pages/onboarding/controller.dart';
import 'package:get/get.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingPageController>(() => OnboardingPageController());
  }
}
