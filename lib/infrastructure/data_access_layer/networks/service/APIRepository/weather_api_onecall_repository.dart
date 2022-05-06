import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIProviders/weather_api_onecall_provider.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_onecall_api.dart';


abstract class IWeatherOneCallRepository {
  Future<WeatherOneCall> getWeatherOneCall(
      {required String lat,required String lon,required String exclude,required String appId});
}

class WeatherOneCallRepository implements IWeatherOneCallRepository {

  final WeatherOneCallProvider weatherOneCallProvider;

  WeatherOneCallRepository({required this.weatherOneCallProvider});

  @override
  Future<WeatherOneCall> getWeatherOneCall({required String lat, required String lon, required String exclude, required String appId}) async {
    final cases = await weatherOneCallProvider.getWeatherOneCall( "lat=" + lat + "&lon=" + lon + "&exclude=" + exclude + "&appid=" +appId);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
