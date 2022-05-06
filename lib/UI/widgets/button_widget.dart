import 'package:flutter/material.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';

import '../../infrastructure/commons/constants/font_constant.dart';
import '../commons/text_widgets/base/headline_body_one_base_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onTap,
    required this.title,
    this.decorationLight = false,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final bool decorationLight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: decorationLight
              ? const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                      side: BorderSide(
                          color: ColorConstants.loginSignupButtonColor)),
                  color: ColorConstants.loginSignupButtonLightColor,
                )
              : const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12.0,
                      ),
                    ),
                  ),
                  color: ColorConstants.loginSignupButtonColor,
                ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: HeadlineBodyOneBaseWidget(
              title: title,
              titleColor: decorationLight
                  ? ColorConstants.appColor
                  : ColorConstants.white,
              fontSize: 16.0,
              fontFamily: FontConstant.overPassBold,
            ),
          ),
        ),
      ),
    );
  }
}
