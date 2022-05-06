import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/UI/screens/HomeScreen/home_controller.dart';
import 'package:weather_demo/UI/screens/HomeScreen/home_screen_arguments.dart';
import 'package:weather_demo/UI/screens/HomeScreen/widget/trmpreture_container.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_routes.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';
import 'package:weather_demo/infrastructure/commons/constants/image_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/language_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/method_constants.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

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
              : Stack(
                  children: [
                    Container(
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
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        //AppBarWidget(),
                        getAppBarWidget(context: context),
                        getBodyWidget(context: context),
                        getForCastReportButton(context: context),
                        const SizedBox(
                          height: 36,
                        )
                      ],
                    ),
                  ],
                ),
        ));
  }

  Widget getAppBarWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: HeadlineBodyOneBaseWidget(
              title: controller.title.value,
              titleColor: ColorConstants.white,
              fontFamily: FontConstant.overPassBold,
              fontSize: 24,
            ),
          ),
          InkWell(
            onTap: () async {
              final result = await Get.toNamed(RoutesConstants.mapScreen);

              controller.locationName = result;
              log("result: ${controller.locationName}");
              controller.weatherJson();
            },
            child: Image.asset(
              ImageConstants.mapImage,
              height: 24,
              width: 24,
              color: ColorConstants.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget getBodyWidget({required BuildContext context}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            MethodConstants.forecastImage(
                images: controller.weather.weather!.elementAt(0).main!),
            width: 170,
            height: 172,
          ),
          getTemperatureWidget(context: context),
        ],
      ),
    );
  }

  Widget getTemperatureWidget({required BuildContext context}) {
    return TemperatureContainer(
        date: AppConstants.todayText.tr + " " + MethodConstants.getDate(timestamp: controller.weather.dt!),
        temperature: (controller.weather.main!.feelsLike! - 273.15).ceil().toString(),
        main: controller.weather.weather!.first.main!,
        wideSubTitle: controller.weather.wind!.speed.toString() + " " + AppConstants.kmhText,
        humSubTitle: controller.weather.main!.humidity.toString() + " %");

  }

  Widget getForCastReportButton({required BuildContext context}) {
    return InkWell(
      onTap: () {

        LatLng latLng = controller.locationName != null ? LatLng(controller.locationName!.latLng!.latitude, controller.locationName!.latLng!.longitude) : LatLng(controller.locationData!.latitude!, controller.locationData!.longitude!);


          Get.toNamed(RoutesConstants.detailScreen,
            arguments: HomeScreenArguments(
                latLng: latLng,
            ),);


      },
      child: Container(
        width: 220,
        decoration: ShapeDecoration(
          color: ColorConstants.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: HeadlineBodyOneBaseWidget(
                fontSize: 18,
                fontFamily: FontConstant.overPassRegular,
                titleColor: ColorConstants.black,
                title: LanguageConstants.forecastReportText.tr,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(ImageConstants.downArrowSvg)
          ],
        ),
      ),
    );
  }
}
