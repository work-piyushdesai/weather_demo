import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../infrastructure/commons/constants/color_constants.dart';
import '../../infrastructure/commons/constants/font_constant.dart';
import '../commons/text_widgets/base/headline_body_one_base_widget.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key, this.onTap, required this.title, required this.logo})
      : super(key: key);

  final GestureTapCallback? onTap;
  final String logo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 343,
          height: 56.0,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12.0,
                ),
              ),
            ),
            color: ColorConstants.subTitleWhiteColor,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  logo,
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: HeadlineBodyOneBaseWidget(
                  title: title,
                  titleColor: ColorConstants.black,
                  fontSize: 16.0,
                  fontFamily: FontConstant.overPassRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
