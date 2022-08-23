// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors

import 'dart:io';

import 'package:barista/core/models/product_sizes_model.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/dropdown/app_drop_down.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/category/data/category_model.dart';
import 'package:barista/modules/product/presentation/add_product/add_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barista/core/storage_service.dart';
import 'package:path/path.dart' as path;
import 'package:barista/core/models/product_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddProductPage extends GetView<AddProductController> {
  XFile? imagePath;
  var image;
  var imageName;

  List<ProductSizes> productSizes = [
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
    ProductSizes(productSize: "Small", productQuantity: 100, productPrice: 100),
  ];
  final FirebaseStorage firebaseStorage = FirebaseStorage();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(appBar: _buildTopBar(), body: _buildBody(context));
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Add Product',
      leadingIcon: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          verticalSpaceMedium,
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                imagePath =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  image = File(imagePath!.path);
                  imageName = File(imagePath!.name);

                  print(image);
                  print(imageName);
                  print("Original Path ${imagePath!.path}");
                  String dir = path.dirname(imagePath!.path);
                  String newPath = path.join(dir, 'faizanali.jpg');
                  print("New Path $newPath");
                  // imagePath.renameSync(newPath);
                });
              },
              child: AppCard(
                child: image != null
                    ? Container(
                        width: 150,
                        height: 150,
                        // color: Colors.teal,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: FileImage(image),
                        )),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: Colors.teal,
                      ),
              ),
            ),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Name',
            hintText: 'Product Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.productNameController,
            validator:
                ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          Obx(() {
            var list = controller.categoryList.value;
            var uiList = list
                .map((e) => DropdownMenuItem<CategoryModel>(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            horizontalSpaceSmall,
                            AppText.body(e.categoryName)
                          ],
                        ),
                      ),
                      value: e,
                    ))
                .toList();
            var selectedUi = list
                .map((e) => AppText.body(
                      e.categoryName,
                      color: Colors.black,
                    ))
                .toList();
            return AppDropDown<CategoryModel>(
              title: 'Product Category',
              hint: 'Product Category',
              selectedItemBuilder: (context) {
                return selectedUi;
              },
              list: uiList,
              value: controller.categoryValue.value,
              onChanged: (value) {
                print(value?.categoryName);
                controller.onChangeCategoryValue(value);
              },
              validator: (value) {
                if (value == null) {
                  return 'This field is required';
                }
              },
            );
          }),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Stock(Quantity)',
            hintText: 'Enter quantity in grams',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.productStockController,
            validator:
                ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Description',
            hintText: 'Product Description',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: controller.productDesController,
          ),
          verticalSpaceRegular,
          Row(
            children: [
              TextButton.icon(
                label: const Text("Add Product Sizes"),
                onPressed: () {
                  print("Entry");
                  showModalBottomSheet(
                      context: context, builder: buildBottomSheet);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          verticalSpaceLarge,
          ListView(
            children: [
              ListTile(
                title: Text(productSizes[0].productPrice.toString()),
              ),
              ListTile(
                title: Text(productSizes[0].productQuantity.toString()),
              ),
              ListTile(
                title: Text(productSizes[0].productSize.toString()),
              ),
            ],
          ),
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(
                btnText: 'Add Product',
                onPressed: () async {
                  await firebaseStorage
                      .uploadImage(imagePath!.path, imagePath!.name)
                      .then((value) => print("done"));
                  // Get.back();
                }),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}

Widget buildBottomSheet(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        verticalSpaceMedium,
        Text(
          "Product Characteristics",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 21),
        ),
        verticalSpaceMedium,
        AppInputField(
          title: 'Product Size',
          hintText: 'Product Size',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          // controller: controller.productDesController,
        ),
        verticalSpaceRegular,
        AppInputField(
          title: 'Product Quantity (gm)',
          hintText: 'Product Quantity in grams',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          // controller: controller.productDesController,
        ),
        verticalSpaceRegular,
        AppInputField(
          title: 'Product Price',
          hintText: 'Product Price',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          // controller: controller.productDesController,
        ),
        verticalSpaceRegular,
        RowExpanded(
          child: AppFilledButton(
              btnText: 'Add Product',
              onPressed: () async {
                print("Save Product");
              }),
        ),
      ],
    ),
    // child: Center(child: Text("This is Bottom Sheet")),
  );
}
