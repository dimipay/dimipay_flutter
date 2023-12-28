import 'package:dimipay/app/services//auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  LoginMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isGoogleLoginSuccess || authService.isAuthenticated ? null : RouteSettings(name: Routes.LOGIN, arguments: {'redirect': route});
  }
}
