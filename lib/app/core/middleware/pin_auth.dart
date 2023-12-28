import 'package:dimipay/app/services//auth/service.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinAuthMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  PinAuthMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return (authService.pin != null || authService.bioKey != null) ? null : RouteSettings(name: Routes.PIN, arguments: {'redirect': route, 'pinPageType': PinPageType.pinAuth});
  }
}
