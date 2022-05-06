import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/DetailScreen/detail_bindings.dart';
import 'package:weather_demo/UI/screens/DetailScreen/detail_screen.dart';
import 'package:weather_demo/UI/screens/HomeScreen/hom_bindings.dart';
import 'package:weather_demo/UI/screens/HomeScreen/home_screen.dart';
import 'package:weather_demo/UI/screens/MapScreen/map_bindings.dart';
import 'package:weather_demo/UI/screens/MapScreen/map_screen.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_routes.dart';
import '../../../UI/screens/SplashSectionScreen/splash_binding.dart';
import '../../../UI/screens/SplashSectionScreen/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.detailScreen,
      page: () => const DetailScreen(),
      binding: DetailBindings(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200)
    ),
    GetPage(
      name: RoutesConstants.mapScreen,
      page: () => const MapScreen(),
      binding: MapBindings(),
    ),
  ];
}
