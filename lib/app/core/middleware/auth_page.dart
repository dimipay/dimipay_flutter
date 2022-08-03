import 'package:dimipay/app/pages/pin_auth/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/auth/service.dart';

class AuthPageMiddleware extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  AuthPageMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return authService.isAuthenticated ?
      null :
      (
          authService.isGoogleLoginSuccess ?
            (route == Routes.PINAUTH ? null : RouteSettings(name: Routes.PINAUTH, arguments: {'redirect': route, 'pageType': PinAuthPageType.register})) :
            RouteSettings(name: Routes.ONBOARDING, arguments: {'redirect': route})
      );
  }
}
