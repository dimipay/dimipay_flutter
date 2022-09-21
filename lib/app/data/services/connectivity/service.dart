import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = true.obs;

  Future<ConnectivityService> init() async {
    _init();
    return this;
  }

  void _init() {
    ever(isConnected, (_) => moveToNoConnectionPage());
    Connectivity().onConnectivityChanged.listen(checkConnection);
  }

  void checkConnection(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      isConnected.value = true;
    }
  }

  void moveToNoConnectionPage() {
    if (!isConnected.value) {
      Get.offNamed(Routes.NOCONNECTION);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    isConnected.close();
    super.onClose();
  }
}
