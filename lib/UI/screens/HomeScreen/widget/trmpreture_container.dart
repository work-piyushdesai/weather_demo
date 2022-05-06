import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:weather_demo/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';
import 'package:weather_demo/infrastructure/commons/constants/image_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/language_constants.dart';
import '../../../../infrastructure/commons/constants/color_constants.dart';

class TemperatureContainer extends StatelessWidget {
  const TemperatureContainer({Key? key, required this.date, required this.temperature, required this.main,  required this.wideSubTitle, required this.humSubTitle,}) : super(key: key);

  final String date;
  final String temperature;
  final String main;
  final String wideSubTitle;
  final String humSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: ColorConstants.white.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: ColorConstants.white,
                width: 1
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:   [
              HeadlineBodyOneBaseWidget(
                fontSize: 18,
                fontFamily: FontConstant.overPassRegular,
                titleColor: ColorConstants.white,
                title: date,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  HeadlineBodyOneBaseWidget(
                    fontSize: 100,
                    fontFamily: FontConstant.overPassRegular,
                    titleColor: ColorConstants.white,
                    title: temperature ,
                    shadows: [
                      Shadow(color: ColorConstants.white.withOpacity(0.25),
                          blurRadius: 40,
                          offset: const Offset(6, 4)
                      ),
                      Shadow(color: ColorConstants.black.withOpacity(0.25),
                          blurRadius: 40,
                          offset: const Offset(2, -3)
                      ),
                      Shadow(color: ColorConstants.black.withOpacity(0.1),
                          blurRadius: 40,
                          offset: const Offset(-4, 8)
                      )
                    ],
                  ),
                  const SizedBox(width: 5,),
                   HeadlineBodyOneBaseWidget(
                    fontSize: 72,
                    fontFamily: FontConstant.overPassRegular,
                    titleColor: ColorConstants.white,
                    title: AppConstants.tempSign.tr,
                  ),
                ],
              ),
               HeadlineBodyOneBaseWidget(
                fontSize: 24,
                fontFamily: FontConstant.overPassBold,
                titleColor: ColorConstants.white,
                title: main,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(ImageConstants.windySvg),
                      const SizedBox(height: 16,),
                      SvgPicture.asset(ImageConstants.humSvg),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: HeadlineBodyOneBaseWidget(
                          fontSize: 18,
                          fontFamily: FontConstant.overPassRegular,
                          titleColor: ColorConstants.white,
                          title: LanguageConstants.windText.tr,
                        ),
                      ),
                      const SizedBox(height: 16,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: HeadlineBodyOneBaseWidget(
                          fontSize: 18,
                          fontFamily: FontConstant.overPassRegular,
                          titleColor: ColorConstants.white,
                          title: LanguageConstants.humText.tr,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 2,
                        height: 18,
                        color: ColorConstants.white,
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        width: 2,
                        height: 18,
                        color: ColorConstants.white,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: HeadlineBodyOneBaseWidget(
                          fontSize: 18,
                          fontFamily: FontConstant.overPassRegular,
                          titleColor: ColorConstants.white,
                          title: wideSubTitle,
                        ),
                      ),

                      const SizedBox(height: 16,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: HeadlineBodyOneBaseWidget(
                          fontSize: 18,
                          fontFamily: FontConstant.overPassRegular,
                          titleColor: ColorConstants.white,
                          title: humSubTitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
