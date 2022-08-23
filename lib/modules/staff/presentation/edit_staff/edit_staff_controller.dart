import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:barista/singleton/singletonConsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../core/routings/app_route.dart';

class EditStaffController extends BaseController {
  var isPasswordObscure = true.obs;
  var isKeepLoginChecked = false.obs;

  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      ageController,
      numberController,
      passwordController;

  @override
  void onInit() {
    firstNameController =
        TextEditingController(text: Singleton.StaffData!['fname']);
    lastNameController =
        TextEditingController(text: Singleton.StaffData!['lname']);
    emailController =
        TextEditingController(text: Singleton.StaffData!['email']);
    ageController = TextEditingController(text: Singleton.StaffData!['age']);
    numberController =
        TextEditingController(text: Singleton.StaffData!['phone_number']);
    passwordController =
        TextEditingController(text: Singleton.StaffData!['password']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onShowOrHidePasswordPressed() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onKeepLoginChanged(bool value) {
    isKeepLoginChecked.value = value;
  }

  void updateStaffInfo(String email, Map<String, dynamic> data) {
    _firestore.collection("Staff").doc(email).update(data);

    Get.offAllNamed(Routes.staff);
    Get.snackbar("Status", "Staff Member Updated");
  }
}
