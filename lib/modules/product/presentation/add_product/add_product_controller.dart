import 'package:barista/core/models/product_sizes_model.dart';
import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:barista/modules/category/data/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/widgets/input/app_input_field.dart';

class AddProductController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  var categoryValue = Rx<CategoryModel?>(null);
  var selectedCategoryItem;
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];

  late TextEditingController productNameController,
      productStockController,
      productDesController,
      productsize;

  List<ProductSizes> productSizes = [
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
  ];

  @override
  void onInit() {
    fetchCategoryData();

    productNameController = TextEditingController();
    productStockController = TextEditingController();
    productDesController = TextEditingController();
    productsize = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetchCategoryData() {
    List<CategoryModel> _categoryModelList = [];
    _firestore.collection('Categories').get().then((value) {
      value.docs.forEach((element) {
        print('Single element: ${element}');
        _categoryModelList.add(CategoryModel.fromMap(element));
        print('List elements: ${categoryList.value}');
      });
    }).whenComplete(() {
      categoryList.value = _categoryModelList;
    }).catchError((error) {
      print('Category Fetch Error: ${error.toString()}');
    });
  }

  void onChangeCategoryValue(CategoryModel? value) {
    // categoryValue.value = value;
    selectedCategoryItem = value?.categoryName.toString();
    print(selectedCategoryItem);
  }

  void onAddProductPressed() {
    var validation = formKey.currentState!.validate();
    if (validation) {}
  }

  void addProduct() {}
}
