import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

import '../../../../infrastructure/commons/constants/image_constants.dart';
import '../../../../infrastructure/commons/constants/language_constants.dart';
import '../../../commons/text_widgets/base/headline_body_one_base_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: SvgPicture.asset(ImageConstants.backArrowSvg),
      ),
    );
  }
}
