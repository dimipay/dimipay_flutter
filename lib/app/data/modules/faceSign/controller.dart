import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/faceSign/repository.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignController extends GetxController with StateMixin {
  final FaceSignRepository repository;
  final Rx<bool> _gallaryOrCamera = false.obs;

  FaceSignController(this.repository);

  registerFaceSign() async {
    XFile? result;

    if (_gallaryOrCamera.value) {
      result = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      result = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (result != null) {
      await repository.register(result);
    } else {
      DPSnackBar.open('No image selected');
    }
  }

  deleteFaceSign() async {
    await repository.delete();
  }
}
