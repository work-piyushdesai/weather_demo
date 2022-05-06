import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_demo/infrastructure/commons/constants/font_constant.dart';

SnackbarController dartSnackBar(String message) {
  return Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.BOTTOM,
    maxWidth: Get.size.width / 1.5,
    margin: const EdgeInsets.only(bottom: 40),
    backgroundColor: ColorConstants.black.withOpacity(.8),
    titleText: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: FontConstant.overPassLight,
        color: ColorConstants.white,
      ),
      textAlign: TextAlign.center,
    ),
    messageText: const SizedBox(height: 0),
  );
}
