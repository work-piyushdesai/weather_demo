import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_demo/UI/screens/MapScreen/map_controller.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/language_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/method_constants.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIRepository/weatherapi_repository.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_api.dart';
import '../../../infrastructure/commons/constants/api_constants.dart';

class HomeController extends GetxController {

  Rx<Color> bgColor = ColorConstants.white.obs;
  RxString title = "".obs;

  MapLocation? locationName;

  HomeController({required this.weatherRepository,});

  WeatherApi weather = WeatherApi();
  RxBool isLoading = true.obs;
  LocationData? locationData;

  final WeatherRepository weatherRepository;

  Future<void> weatherJson() async {

    isLoading.value = true;

    if(locationName != null) {
      locationData = LocationData.fromMap(
          {"latitude" : locationName!.latLng!.latitude, "longitude" : locationName!.latLng!.longitude});
      title.value = locationName!.placeName!;
    } else {
      locationData = await MethodConstants.getLocation();
      title.value = LanguageConstants.currentLocation.tr;
    }

    if(locationData != null) {
      weather = await weatherRepository.getWeatherApi(
          lat: locationData!.latitude!.toString(), lon: locationData!.longitude!.toString(), appId: ApiConstants.appid);
      isLoading.value = false;
    }

  }

  @override
  void onInit() {
    weatherJson();
    super.onInit();
  }
}
