import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  AuthPageMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAuthenticated ? null : RouteSettings(name: Routes.LOGIN, arguments: {'redirect': route});
  }
}
