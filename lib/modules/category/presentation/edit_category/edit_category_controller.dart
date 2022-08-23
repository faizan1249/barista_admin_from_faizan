import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:barista/modules/category/data/category_model.dart';
import 'package:barista/singleton/singletonConsts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditCategoryController extends BaseController {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();

  String categoryName = '';
  String categoryType = '';
  String categoryDes = '';
  String docId = '';

  CategoryModel? _categoryModel;

  late TextEditingController categoryNameController, categoryTypeController, categoryDescriptionController;

  @override
  void onInit() {
    _categoryModel = Singleton.currentCategoryModel;
    docId = Singleton.DocumentID;
    categoryNameController = TextEditingController(text: _categoryModel?.categoryName);
    categoryTypeController = TextEditingController(text: _categoryModel?.categoryType);
    categoryDescriptionController = TextEditingController(text: _categoryModel?.description);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> updateCategory() async {
    var validator = formKey.currentState!.validate();
    if(validator) {
      categoryName = categoryNameController.value.text.trim();
      categoryType = categoryTypeController.value.text.trim();
      categoryDes = categoryDescriptionController.value.text.trim();

      CategoryModel categoryModel = CategoryModel(categoryName: categoryName, categoryType: categoryType, description: categoryDes);

      _firestore.collection('Categories')
          .doc(docId)
          .set(categoryModel.toMap())
          .whenComplete(() {
        print('done');
        Get.offAllNamed(Routes.category);
        Get.snackbar('Status', 'Category Updated');
      })
          .catchError((e) {
        Get.snackbar('Something Wrong', e.toString());
      });

    }
  }

}