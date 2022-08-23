import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:barista/modules/category/data/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCategoryController extends BaseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String categoryName = "";
  String categoryType = "";
  String categoryDes = "";

  final formKey = GlobalKey<FormState>();
  late TextEditingController categoryNameController, categoryTypeController, categoryDescriptionController;

  @override
  void onInit() {
    categoryNameController = TextEditingController();
    categoryTypeController = TextEditingController();
    categoryDescriptionController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void checkLogin() {
    var validator = formKey.currentState!.validate();
    if(validator) {
      print('Check if');
    }
  }

  Future<void> addCategory() async {
    var validator = formKey.currentState!.validate();
    if(validator) {
      categoryName = categoryNameController.value.text.trim();
      categoryType = categoryTypeController.value.text.trim();
      categoryDes = categoryDescriptionController.value.text.trim();
      CategoryModel categoryModel = CategoryModel(categoryName: categoryName, categoryType: categoryType, description: categoryDes);
      _firestore.collection('Categories')
        .doc()
        .set(categoryModel.toMap())
        .whenComplete(() {
          print('done');
          Get.back();
          Get.snackbar('Status', 'Category Added');
        })
        .catchError((e) {
          Get.snackbar('Something Wrong', e.toString());
        });
    }
    }
  }
