import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_demo/UI/screens/SplashSectionScreen/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: null,
          backgroundColor: controller.backGroundColor.value,
          body: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
