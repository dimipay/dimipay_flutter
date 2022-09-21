import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = true.obs;
  final RxBool once = false.obs;

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
      once.value = true;
      Get.toNamed(Routes.NOCONNECTION);
    } else if (once.value) {
      once.value = false;
      Get.back();
    }
  }

  @override
  void onClose() {
    isConnected.close();
    super.onClose();
  }
}
