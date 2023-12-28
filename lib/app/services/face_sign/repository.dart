import 'package:dimipay/app/provider/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class FaceSignRepository {
  final ApiProvider api;

  FaceSignRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<void> registerFaceSign(XFile image) async {
    String url = "/auth/face";
    final formData = FormData.fromMap({'image': await MultipartFile.fromFile(image.path)});
    await api.post(url, data: formData);
  }

  Future<Map> deleteFaceSign() async {
    String url = "/auth/face";
    Response response = await api.delete(url);
    return response.data;
  }

  Future<bool> faceSignRegistered() async {
    String url = "/user/me/face-registered";
    Response response = await api.get(url);
    return response.data['registered'];
  }
}
