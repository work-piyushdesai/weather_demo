import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/SplashSectionScreen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
