import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/app_colors.dart';
import 'core/constant/app_strings.dart';
import 'core/routings/app_route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: title,
      smartManagement: SmartManagement.full,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: ThemeData(
          primarySwatch: kcPrimaryMaterialColor, fontFamily: 'Poppins'),
    );
  }
}
