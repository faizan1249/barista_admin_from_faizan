// import 'dart:io';

import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

class AddStaffController extends BaseController {
  var isPasswordObscure = true.obs;
  var isKeepLoginChecked = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // File? imageFile;
  String? UserEmail = '';

  final formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      ageController,
      numberController,
      passwordController;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    ageController = TextEditingController();
    numberController = TextEditingController();
    passwordController = TextEditingController();
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

  Future<void> addDataToFirebase() async {
    print(emailController.value.text.toString().trim());
    var FirebaseUser = await FirebaseFirestore.instance
        .collection('Staff')
        .doc(emailController.value.text.toString().trim())
        .get()
        .then((value) {
      if (value.data()?['email'] != null) {
        UserEmail = value.data()?['email'];
      }
    });
    print("Firebase Email :" + UserEmail!);
    if (UserEmail == emailController.value.text.toString().trim()) {
      print("User Exist");
      Get.snackbar("Status", "User Exists");
    } else {
      print("User Not Exist");
      Map<String, dynamic> body = {
        'fname': firstNameController.value.text.toString().trim(),
        'lname': lastNameController.value.text.toString().trim(),
        'email': emailController.value.text.toString().trim(),
        'age': ageController.value.text.toString().trim(),
        'phone_number': numberController.value.text.toString().trim(),
        'password': passwordController.value.text.toString().trim(),
      };
      _firestore
          .collection('Staff')
          .doc(emailController.value.text.toString().trim())
          .set(body);

      Get.back();

      Get.snackbar("Status", "Staff Member Added");
    }
  }
}
