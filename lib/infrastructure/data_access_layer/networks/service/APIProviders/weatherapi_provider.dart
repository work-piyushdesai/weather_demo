import 'package:get/get_connect/connect.dart';
import 'package:weather_demo/infrastructure/commons/constants/api_constants.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_api.dart';

abstract class IWeatherProvider {
  Future<Response<WeatherApi>> getWeatherApi(
      String path);
}

class WeatherProvider extends GetConnect implements IWeatherProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => WeatherApi.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = ApiConstants.apiUrl;
    super.onInit();
  }
  @override
  Future<Response<WeatherApi>> getWeatherApi(String path) {
    return get(path);
  }
}