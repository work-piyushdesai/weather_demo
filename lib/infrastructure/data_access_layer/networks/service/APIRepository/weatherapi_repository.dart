import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIProviders/weatherapi_provider.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_api.dart';

abstract class IWeatherRepository {
  Future<WeatherApi> getWeatherApi(
      {required String lat,required String lon,required String appId});
}

class WeatherRepository implements IWeatherRepository {

  final WeatherProvider weatherProvider;

  WeatherRepository({required this.weatherProvider});

  @override
  Future<WeatherApi> getWeatherApi({required String lat, required String lon,required String appId}) async {
    final cases = await weatherProvider.getWeatherApi("lat=" + lat + "&lon=" + lon + "&appid=" +appId);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
