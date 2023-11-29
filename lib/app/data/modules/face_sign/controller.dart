import 'package:dimipay/app/data/modules/face_sign/repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignController extends GetxController with StateMixin {
  final FaceSignRepository repository;
  final Rx<bool> _isCamera = true.obs;
  final Rx<bool?> _isFacesignRegistered = Rx(null);
  bool? get isFacesignRegistered => _isFacesignRegistered.value;

  FaceSignController({FaceSignRepository? repository}) : repository = repository ?? FaceSignRepository();

  Future<void> fetchIsFacesignRegistered() async {
    try {
      change(isFacesignRegistered, status: RxStatus.loading());
      _isFacesignRegistered.value = await repository.faceSignRegistered();
      change(isFacesignRegistered, status: RxStatus.success());
    } catch (e) {
      change(isFacesignRegistered, status: RxStatus.error());
      rethrow;
    }
  }

  Future<XFile?> _pickImage() async {
    if (_isCamera.value) {
      return await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 2048, maxWidth: 1024);
    } else {
      return await ImagePicker().pickImage(source: ImageSource.gallery);
    }
  }

  Future<void> registerFaceSign() async {
    XFile? image = await _pickImage();

    if (image == null) {
      throw Exception('선택된 사진이 없어요.');
    }

    await repository.registerFaceSign(image);
    _isFacesignRegistered.value = true;
  }

  Future<void> deleteFaceSign() async {
    await repository.deleteFaceSign();
    _isFacesignRegistered.value = false;
  }
}
