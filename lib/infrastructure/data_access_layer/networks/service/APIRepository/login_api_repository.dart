import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIProviders/login_api_provider.dart';
import 'package:weather_demo/infrastructure/models/responses/login_response_model.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> getLoginAPIResponse(String loginRequestJson);
}

class LoginAPIRepository implements ILoginRepository {
  final ILoginProvider provider;

  LoginAPIRepository({required this.provider});

  @override
  Future<LoginResponseModel> getLoginAPIResponse(
      String loginRequestJson) async {
    final loginResponseModel =
        await provider.getCases("/users/getcode", loginRequestJson);

    if (loginResponseModel.status.hasError) {
      return Future.error(loginResponseModel.statusText!);
    } else {
      return loginResponseModel.body!;
    }
  }
}
