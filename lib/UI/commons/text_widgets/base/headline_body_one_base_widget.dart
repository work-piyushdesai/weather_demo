import 'package:flutter/material.dart';

import '../../../../infrastructure/commons/constants/font_constant.dart';

class HeadlineBodyOneBaseWidget extends StatelessWidget {
  const HeadlineBodyOneBaseWidget({
    Key? key,
    this.title,
    this.titleColor,
    this.titleTextAlign = TextAlign.left,
    this.maxLine,
    this.fontWeight,
    this.textOverflow,
    this.fontSize,
    this.foreground,
    this.fontFamily,
    this.underline = false,
    this.letterSpacing,
    this.shadows,
  }) : super(key: key);

  final String? title;
  final Color? titleColor;
  final TextAlign? titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final double? fontSize;
  final Paint? foreground;
  final String? fontFamily;
  final bool underline;
  final double? letterSpacing;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(

      title ?? '',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: foreground == null ? titleColor : null,
            fontSize: fontSize,
            fontFamily: fontFamily ?? FontConstant.overPassRegular,
            foreground: titleColor == null ? foreground : null,
            fontWeight: fontWeight ?? FontWeight.normal,
            decoration: underline ? TextDecoration.underline : null,
            letterSpacing: letterSpacing,
        shadows: shadows,

          ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
