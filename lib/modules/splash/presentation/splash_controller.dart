import 'dart:async';

import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/shared_preference/app_shared_preference.dart';
import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  var timeout = 3.obs;

  bool? isUserLoggedIn = false;

  @override
  void onInit() {
    super.onInit();
    isUserLoggedIn = AppSharedPreferences.getUserLoggedInStatus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      if(isUserLoggedIn != null || isUserLoggedIn == true) {
        Get.toNamed(Routes.dashboard);
      }
      else {
        Get.toNamed(Routes.login);
      }
    });
  }
}