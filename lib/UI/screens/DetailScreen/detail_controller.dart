import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/HomeScreen/home_screen_arguments.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/data_access_layer/networks/service/APIRepository/weather_api_onecall_repository.dart';
import 'package:weather_demo/infrastructure/models/responses/weather_onecall_api.dart';

import '../../../infrastructure/commons/constants/api_constants.dart';

class DetailController extends GetxController {
  Rx<Color> bgColor = ColorConstants.white.obs;

  RxBool isSelected = false.obs;
  RxList<NextForecast> nextForecast = <NextForecast>[].obs;

  RxList<Current> hourly = <Current>[].obs;
  RxList<Daily> daily = <Daily>[].obs;
  String lat = "";
  String lon = "";


  HomeScreenArguments? mapLocation;

  WeatherOneCall weatherOneCall = WeatherOneCall();
  RxBool isLoading = true.obs;
  RxBool isCurrent = true.obs;

  final WeatherOneCallRepository weatherOneCallRepository;

  DetailController({required this.weatherOneCallRepository});

  Future<void> weatherOneCallJson() async {
    weatherOneCall = await weatherOneCallRepository.getWeatherOneCall(
        lat: lat,
        lon: lon,
        exclude: ApiConstants.exclude,
        appId: ApiConstants.appid);
    if (weatherOneCall.hourly != null && weatherOneCall.hourly!.isNotEmpty) {
      hourly.value = weatherOneCall.hourly!;
    }
    if (weatherOneCall.daily != null && weatherOneCall.daily!.isNotEmpty) {
      daily.value = weatherOneCall.daily!;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {

    if(Get.arguments != null){
      mapLocation = Get.arguments;
      lat = mapLocation!.latLng!.latitude.toString();
      lon = mapLocation!.latLng!.longitude.toString();
      log("arguments: $mapLocation");
    }

    weatherOneCallJson();
    super.onInit();
  }
}

class NextForecast {
  final String date;
  final String main;
  final String temp;

  NextForecast({required this.date, required this.main, required this.temp});
}
