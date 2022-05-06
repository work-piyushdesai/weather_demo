import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/MapScreen/map_controller.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }

}