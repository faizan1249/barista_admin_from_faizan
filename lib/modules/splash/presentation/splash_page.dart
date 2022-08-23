import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/modules/splash/presentation/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return BaseScaffold(
      shouldIncludeScrolling: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/branding/logo.jpg')),
        ],
      ),
    );
  }

}