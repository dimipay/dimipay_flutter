import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignRepository {
  final ApiInterface api;

  FaceSignRepository(this.api);

  Future<void> register(XFile image) => api.registerFaceSign(image);
  Future<void> delete() => api.deleteFaceSign();

	Future<bool> facesignRegistered() => api.faceSignRegistered();
}
