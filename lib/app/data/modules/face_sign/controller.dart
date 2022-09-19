import 'dart:developer';
import 'dart:io';

import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/faceSign/repository.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignController extends GetxController with StateMixin {
  final FaceSignRepository repository;
  final Rx<bool> _isCamera = true.obs;

  FaceSignController(this.repository);

  Future<bool> registerFaceSign() async {
    XFile? image;

    if (_isCamera.value) {
      image = await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 2048, maxWidth: 1024);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      try {
        final result = await repository.register(image);
        return (result["code"] == 'OK');
      } on DioError catch (e) {
        rethrow;
      }
    } else {
      throw FaceSginException('선택된 이미지가 없습니다.');
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
