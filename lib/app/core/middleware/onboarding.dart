import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  OnboardingMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAuthenticated ? null : RouteSettings(name: Routes.PIN, arguments: {'redirect': route, 'pinPageType': PinPageType.ONBOARDING});
  }
}
