import 'dart:async';
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
  final Rx<Vector3> _rv = Rx(Vector3());
  late StreamSubscription streamSubscription;
  final double fromx = -2;
  final double tox = 2;
  final double fromy = -2;
  final double toy = 2;
  final double fromz = -2;
  final double toz = 2;
  Vector3 get v => _rv.value;

  Vector3 conv(Vector3 v) {
    double x = v.x, y = v.y, z = v.z;
    return Vector3(x: atan(x / sqrt(y * y + z * z)), y: atan(y / sqrt(x * x + z * z)), z: atan(z / sqrt(x * x + y * y)));
  }

  double rangeData(double from, double to, double data) {
    if (data < from) {
      return from;
    }
    if (to < data) {
      return to;
    }
    return data;
  }

  void handleData(GyroscopeEvent event) {
    Vector3 dv = Vector3(x: -0.05 * event.x, y: -0.05 * event.y);
    Vector3 tv = _rv.value.sub(dv);
    _rv.value = Vector3(x: rangeData(fromx, tox, tv.x), y: rangeData(fromy, toy, tv.y), z: rangeData(fromz, toz, tv.z));
  }

  void onDrag(double dx, double dy) {
    Vector3 dv = Vector3(x: -0.05 * dy, y: -0.05 * dx);
    Vector3 tv = _rv.value.sub(dv);
    _rv.value = Vector3(x: rangeData(fromx, tox, tv.x), y: rangeData(fromy, toy, tv.y), z: rangeData(fromz, toz, tv.z));
  }

  @override
  void onInit() async {
    streamSubscription = gyroscopeEvents.listen(handleData);
    super.onInit();
  }

  @override
  void onClose() async {
    streamSubscription.cancel();
    super.onClose();
  }
}
