import 'package:flutter/material.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

class CaptionBaseWidget extends StatelessWidget {
  final String? fontFamily;

  const CaptionBaseWidget({
    required Key key,
    required this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.left,
    required this.maxLine,
    this.fontFamily,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  final TextAlign titleTextAlign;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.caption!.apply(
          color: titleColor,
          fontFamily: fontFamily ?? FontConstant.overPassRegular),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
