import 'dart:developer' as dev;
import 'dart:math';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class LoginPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future loginWithGoogle() async {
    try {
      change(null, status: RxStatus.loading());
      await authService.loginWithGoogle();
      if (authService.isGoogleLoginSuccess) {
        final String nextRoute = redirect ?? Routes.HOME;
        Get.offNamed(nextRoute);
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}

class Vector3 {
  double x;
  double y;
  double z;
  Vector3({this.x = 0, this.y = 0, this.z = 0});

  Vector3 sub(Vector3 v) {
    return Vector3(x: x - v.x, y: y - v.y, z: z - v.z);
  }
}

class GyroScopeController extends GetxController {
  Rx<Vector3> vector = Rx(Vector3());
  late Vector3 initialVector;

  Vector3 conv(Vector3 v) {
    double x = v.x, y = v.y, z = v.z;
    return Vector3(x: atan(x / sqrt(y * y + z * z)), y: atan(y / sqrt(x * x + z * z)), z: atan(z / sqrt(x * x + y * y)));
  }

  @override
  void onInit() async {
    // gyroscopeEvents.listen((GyroscopeEvent event) {
    // 	vector.value = conv(Vector3(x: event.x, y: event.y, z: event.z));
    // });
    super.onInit();
  }
}
