import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<User> {
  final UserRepository repository;
  UserController(this.repository);

  final Rx<User?> _user = Rx(null);
  User? get user => _user.value;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  Future fetchUser() async {
    try {
      change(user, status: RxStatus.loading());
      _user.value = await repository.get();
      change(user, status: RxStatus.success());
    } catch (e) {
      change(user, status: RxStatus.error());
      rethrow;
    }
  }
}
