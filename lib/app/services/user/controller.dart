import 'package:dimipay/app/data/services/user/model.dart';
import 'package:dimipay/app/data/services/user/repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<User> {
  final UserRepository repository;

  UserController({UserRepository? repository}) : repository = repository ?? UserRepository();

  final Rx<User?> _user = Rx(null);
  User? get user => _user.value;

  Future fetchUser() async {
    try {
      change(user, status: RxStatus.loading());
      _user.value = await repository.getUserInfo();
      change(user, status: RxStatus.success());
    } catch (e) {
      change(user, status: RxStatus.error());
      rethrow;
    }
  }
}
