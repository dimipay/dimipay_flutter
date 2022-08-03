import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/auth/service.dart';

class OnboardingPageMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  OnboardingPageMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAuthenticated ? null : RouteSettings(name: Routes.ONBOARDING, arguments: {'redirect': route});
  }
}
