import 'package:flutter/material.dart';

import '../../infrastructure/commons/constants/color_constants.dart';
import '../../infrastructure/commons/constants/font_constant.dart';
import '../commons/text_widgets/base/headline_body_one_base_widget.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton(
      {Key? key,
      this.onTap,
      required this.title,
      required this.disableButton,
      required this.borderRadius})
      : super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final bool disableButton;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          color: disableButton
              ? ColorConstants.disabledButtonColor.withOpacity(0.4)
              : ColorConstants.signInButtonColor,
        ),
        child: Center(
          child: HeadlineBodyOneBaseWidget(
            title: title,
            fontSize: 16.0,
            fontFamily: FontConstant.overPassRegular,
          ),
        ),
      ),
    );
  }
}
