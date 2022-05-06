import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/DetailScreen/detail_controller.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIProviders/weather_api_onecall_provider.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIRepository/weather_api_onecall_repository.dart';

class DetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(weatherOneCallRepository: Get.find()));
    Get.lazyPut(() => WeatherOneCallProvider());
    Get.lazyPut(()=>WeatherOneCallRepository(weatherOneCallProvider: Get.find()));
  }

}