import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageMiddleware extends GetMiddleware {
  final AppConfigService config = Get.find<AppConfigService>();

  OnboardingPageMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return config.needOnboarding ? RouteSettings(name: Routes.ONBOARDING, arguments: {'redirect': route}) : null;
  }
}
