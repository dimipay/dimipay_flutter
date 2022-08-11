import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<Rx<User?>> {
  final UserRepository repository;
  UserController(this.repository);

  Rx<User?> user = Rx(null);

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future _loadData() async {
    change(null, status: RxStatus.loading());
    user = Rx(await repository.get());
    change(user, status: RxStatus.success());
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await _loadData();
    HapticFeedback.mediumImpact();
  }
}
