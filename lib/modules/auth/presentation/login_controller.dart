import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/shared_preference/app_shared_preference.dart';
import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends BaseController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController emailController, passwordController;

  final formKey = GlobalKey<FormState>();
  var isPasswordObscure = true.obs;
  var isKeepLoginChecked = false.obs;
  String UserEmail = "";
  String UserPassword = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onShowOrHidePasswordPressed() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onKeepLoginChanged(bool value) {
    isKeepLoginChecked.value = value;
  }

  // void onLogin() async {
  //   await AppSharedPreferences.setUserLoggedInStatus(true);
  // }

  void onLoginPressed(String email, String password) async {
    var FirebaseUser = await FirebaseFirestore.instance
        .collection('AdminCred')
        .doc('admin')
        .get()
        .then((value) async {
      UserEmail = value.data()!['username'];
      UserPassword = value.data()!['password'];

      if (UserEmail == email && UserPassword == password) {
        await AppSharedPreferences.setUserLoggedInStatus(isKeepLoginChecked.value);
        print("Username :: " + UserEmail.toString());
        print("Password :: " + UserPassword.toString());
        Get.snackbar("Status", "Sign In Successful");
        Get.offAllNamed(Routes.dashboard);
      } else {
        Get.snackbar("Status", "Invalid Username or Password");
      }

      // print(value.data()!['password']);
    });
  }
}
