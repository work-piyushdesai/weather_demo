import 'package:get/get_connect.dart';
import 'package:weather_demo/infrastructure/commons/constants/language_constants.dart';
import 'package:weather_demo/infrastructure/models/responses/login_response_model.dart';

abstract class ILoginProvider {
  Future<Response<LoginResponseModel>> getCases(
      String path, String loginRequestJson);
}

class LoginProvider extends GetConnect implements ILoginProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginResponseModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = LanguageConstants.baseUrl;
  }

  @override
  Future<Response<LoginResponseModel>> getCases(
          String path, String loginRequestJson) =>
      post(path, loginRequestJson,
          headers: {"Content-type": "application/json"});
}
