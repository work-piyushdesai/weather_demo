import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../infrastructure/commons/constants/color_constants.dart';
import '../../infrastructure/commons/constants/font_constant.dart';
import '../commons/text_widgets/base/headline_body_one_base_widget.dart';

class GoogleLogIn extends StatelessWidget {
  const GoogleLogIn({Key? key, this.onTap, required this.title})
      : super(key: key);

  final GestureTapCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.0,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          color: ColorConstants.googleButtonBackGroundColor,
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      4.0,
                    ),
                  ),
                ),
                color: ColorConstants.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "ImageConstants.googleIcon",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: title,
                titleColor: ColorConstants.white,
                fontSize: 16.0,
                fontFamily: FontConstant.overPassRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
