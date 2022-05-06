import 'package:get/get_connect/connect.dart';
import 'package:weather_demo/infrastructure/commons/constants/api_constants.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_onecall_api.dart';


abstract class IWeatherOneCallProvider {
  Future<Response<WeatherOneCall>> getWeatherOneCall(
      String path);
}

class WeatherOneCallProvider extends GetConnect implements IWeatherOneCallProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => WeatherOneCall.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = ApiConstants.oneCallUrl;
    super.onInit();
  }
  @override
  Future<Response<WeatherOneCall>> getWeatherOneCall(String path) {
    return get(path);
  }
}