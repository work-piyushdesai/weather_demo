import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/HomeScreen/home_controller.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIProviders/weatherapi_provider.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIRepository/weatherapi_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(weatherRepository: Get.find()));
    Get.lazyPut(() => WeatherProvider());
    Get.lazyPut(()=>WeatherRepository(weatherProvider: Get.find()));
  }
}
