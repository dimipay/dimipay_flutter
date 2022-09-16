import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/faceSign/repository.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignController extends GetxController with StateMixin {
  final FaceSignRepository repository;
  final Rx<bool> _isCamera = true.obs;

  FaceSignController(this.repository);

  Future<void> registerFaceSign() async {
    XFile? image;

    if (_isCamera.value) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      try {
        final result = await repository.register(image);
        if (result["code"] == "OK") {
          DPSnackBar.open("얼굴 등록에 성공했어요.");
        } else {
          DPErrorSnackBar().open('얼굴 등록에 실패했습니다.');
        }
      } on DioError catch (e) {
        rethrow;
      }
    } else {
      DPSnackBar.open('No image selected');
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
