import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/repository.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignController extends GetxController with StateMixin {
  final FaceSignRepository repository;
  final Rx<bool> _isCamera = true.obs;

  FaceSignController(this.repository);

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
      return;
    }

    try {
      await repository.register(image);
      DPSnackBar.open("얼굴 등록에 성공했어요.", hapticFeedback: HapticPatterns.success);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }

  Future<void> deleteFaceSign() async {
    try {
      await repository.delete();
      DPSnackBar.open('얼굴 삭제가 완료되었습니다.');
    } on DioError catch (e) {
      rethrow;
    }
  }
}
