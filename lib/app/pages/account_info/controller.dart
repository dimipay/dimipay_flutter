import 'package:dimipay/app/data/models/user.dart';
import 'package:dimipay/app/pages/account_info/repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<Rx<User?>> {
  final UserRepository repository;
  UserController(this.repository);

  late Rx<User?> user;

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
