import 'package:flutter/material.dart';

import '../../../../infrastructure/commons/constants/font_constant.dart';

class HeadlineOverlineBaseWidget extends StatelessWidget {
  final String? fontFamily;

  const HeadlineOverlineBaseWidget({
    Key? key,
    this.title,
    this.titleColor = Colors.black,
    this.titleTextAlign = TextAlign.center,
    this.fontFamily,
  }) : super(key: key);
  final String? title;
  final Color titleColor;
  final TextAlign titleTextAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.overline!.apply(
            color: titleColor,
            fontFamily: fontFamily ?? FontConstant.overPassRegular,
          ),
      textAlign: titleTextAlign,
    );
  }
}
