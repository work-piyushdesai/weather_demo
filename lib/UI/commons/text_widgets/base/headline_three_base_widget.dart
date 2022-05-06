import 'package:flutter/material.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

class HeadlineThreeBaseWidget extends StatelessWidget {
  final String? fontFamily;

  const HeadlineThreeBaseWidget(
      {Key? key,
      this.title,
      this.titleColor,
      this.titleTextAlign,
      this.foreground,
      this.fontFamily})
      : super(key: key);
  final String? title;
  final Color? titleColor;
  final TextAlign? titleTextAlign;
  final Paint? foreground;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: foreground == null ? titleColor : null,
            fontSize: 24,
            foreground: titleColor == null ? foreground ?? Paint() : null,
            fontFamily: fontFamily ?? FontConstant.overPassMedium,
          ),
      textAlign: titleTextAlign ?? TextAlign.center,
    );
  }
}
