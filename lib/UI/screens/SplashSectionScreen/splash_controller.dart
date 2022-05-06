import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_demo/infrastructure/commons/constants/app_routes.dart';
import 'package:weather_demo/infrastructure/commons/constants/color_constants.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rx<GlobalKey> globalKey = GlobalKey().obs;



  Rx<Color> backGroundColor = ColorConstants.white.obs;

  @override
  void onInit() {
    super.onInit();
    moveToNext();
  }

  moveToNext() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Get.toNamed(RoutesConstants.homeScreen);
    });
  }

/*  moveToNext() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      //bool isVisit = getStorage.value.read(StorageConstants.VisitBoolean) ?? false;
      bool isLoggedIn =
          getStorage.value.read(StorageConstants.isLoggedIn) ?? false;

      if (isLoggedIn) {
        String userId = getStorage.value.read(StorageConstants.authToken);
        UserModel userModel = await Auth.getUserFireStore(userId);
        bool isUser = await checkUserIsFellow();
        bool isswipuEnabled = await checkswipuEnabled();
        BaseConstant.jobsFlag = await checkJobsFlag();
        await Auth().storeUserLocal(userModel);
        //Fetch User Profile Data and storing in to the GetStorage
        try {
          UserProfile userModel =
              await _userProfileRepository.fetchUserProfileData();
          getStorage.value.write(
              StorageConstants.userProfileData, userProfileToJson(userModel));
        } catch (e) {
          log("Error $e");
        }

        if (userModel.userTermsConditionEnable == "0" ||
            userModel.userPrivacyPolicyEnable == "0") {
          Get.toNamed(RoutesConstants.termsAndConditionScreen);
        } else if (userModel.userEmailVerified == "0") {
          Get.offAllNamed(RoutesConstants.verifyEmailAddressScreen);
        } else if (!isUser) {
          Get.offAllNamed(RoutesConstants.landingScreen);
        } else if (!isswipuEnabled) {
          Get.offAllNamed(RoutesConstants.waitListForFellowsScreen);
        } else if (isswipuEnabled && await checkUserIsEnrolled()) {
          Get.offAllNamed(RoutesConstants.welcomeToBetaTesterScreen);
        } else if (userModel.userQuestionAndAnswers.isEmpty) {
          Get.offAllNamed(RoutesConstants.messageScreen);
        } else {
          Get.offAllNamed(RoutesConstants.homeScreen);
        }
      }
      */
/*else if(isVisit) {
        Get.offAllNamed(RoutesConstants.loginScreen);
      } */
/*
      else {
        Get.offAllNamed(RoutesConstants.onBoardingScreen);
      }
    });
  }*/

/*getAndSetPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    log("version name : $version, appName : $appName, packageName :$packageName, buildNumber : $buildNumber");
  }

  getAndStoreDeviceTokenAndDeviceId() async {
    try {
      String? deviceToken = await FirebaseMessaging.instance.getToken();
      log("device Token splash :  $deviceToken");

    } catch (e) {
      log("");

    }

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      log("device id android splash :  ${androidInfo.androidId}");

    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      log("device id ios splash :  ${iosInfo.identifierForVendor}");

    }
  }
*/

}
