// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/UI/screens/DetailScreen/Widget/appbar_widget.dart';
import 'package:weather_demo/UI/screens/DetailScreen/Widget/next_forecast_widget.dart';
import 'package:weather_demo/UI/screens/DetailScreen/Widget/today_temperature_list.dart';
import 'package:weather_demo/UI/screens/DetailScreen/detail_controller.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/language_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/method_constants.dart';
import '../../../infrastructure/commons/constants/font_constant.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: null,
          backgroundColor: controller.bgColor.value,
          body: controller.isLoading.value
              ? const Center(
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        Color(0xFF48BEE1),
                        Color(0xFF48B5E7),
                        Color(0xFF4B95FD),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      const AppBarWidget(),
                      getBodyWidget(context: context),
                      const SizedBox(
                        height: 36,
                      )
                    ],
                  ),
                ),
        ));
  }

  Widget getBodyWidget({required BuildContext context}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.todayText.tr,
                  titleColor: ColorConstants.white,
                  fontFamily: FontConstant.overPassBlack,
                  fontSize: 24,
                ),
                HeadlineBodyOneBaseWidget(
                  title: MethodConstants.getDate(
                      timestamp: controller.hourly.elementAt(0).dt!.toInt()),
                  titleColor: ColorConstants.white,
                  fontFamily: FontConstant.overPassRegular,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          getTodayTemperature(context: context),
          const SizedBox(
            height: 50,
          ),
          Expanded(child: getNextForecastWidget(context: context)),
        ],
      ),
    );
  }

  Widget getTodayTemperature({required BuildContext context}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(controller.hourly.value.length, (i) {
          return TodayTemperature(
            isBorder: i == 2,
              date: (controller.hourly.value.elementAt(i).feelsLike! - 273.15).ceil().toString() + AppConstants.cText.tr,
              temperature: MethodConstants.getHours(timestamp: controller.hourly.elementAt(i).dt!.toInt()),
              forecastImage: MethodConstants.forecastImage(images: controller.hourly.elementAt(i).weather!.elementAt(0).main!)
          );
        }),
      ),
    );
  }

  Widget getNextForecastWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.nextForecastText.tr,
            fontFamily: FontConstant.overPassBlack,
            titleColor: ColorConstants.white,
            fontSize: 22,
            titleTextAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(controller.daily.value.length, (i) {
                  return NextForecastListWidget(
                    temperature: (controller.daily.elementAt(i).feelsLike!.day - 273.15).ceil().toString() + AppConstants.cText.tr,
                    forecastImage: (MethodConstants.forecastImage(images: controller.daily.elementAt(i).weather!.elementAt(0).main!)),
                    date: MethodConstants.getDate(timestamp: controller.daily.elementAt(i).dt!.toInt()),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

}
