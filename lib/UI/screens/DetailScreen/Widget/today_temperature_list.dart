import 'package:flutter/material.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

class TodayTemperature extends StatelessWidget {
  const TodayTemperature({Key? key, this.isBorder = false, required this.date, required this.temperature, required this.forecastImage}) : super(key: key);

  final bool isBorder;
  final String date;
  final String temperature;
  final String forecastImage;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: isBorder ? ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:  const BorderSide(color: ColorConstants.white,)
              ),
              color: ColorConstants.white.withOpacity(0.3)
          ) : const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title:temperature,
                  titleColor: ColorConstants.white,
                  fontFamily: FontConstant.overPassRegular,
                  fontSize: 18,
                ),
                const SizedBox(height: 16,),
                Image.asset(forecastImage,width: 35,height: 35),
                const SizedBox(height: 16,),
                HeadlineBodyOneBaseWidget(
                  title: date,
                  titleColor: ColorConstants.white,
                  fontFamily: FontConstant.overPassRegular,
                  fontSize: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
