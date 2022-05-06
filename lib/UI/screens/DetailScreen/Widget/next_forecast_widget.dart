import 'package:flutter/material.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

class NextForecastListWidget extends StatelessWidget {
  const NextForecastListWidget({Key? key, required this.date, required this.temperature, required this.forecastImage}) : super(key: key);

  final String date;
  final String temperature;
  final String forecastImage;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadlineBodyOneBaseWidget(
            title: date,
            titleColor: ColorConstants.white,
            fontFamily: FontConstant.overPassRegular,
            fontSize: 18,
          ),

          Image.asset(
            forecastImage,
            width: 35,
            height: 35,
          ),
          //const SizedBox(height: 5,),
          HeadlineBodyOneBaseWidget(
            title: temperature,
            titleColor: ColorConstants.white,
            fontFamily: FontConstant.overPassRegular,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}