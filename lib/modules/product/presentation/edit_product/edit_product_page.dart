import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/product/presentation/edit_product/edit_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPage extends GetView<EditProductController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody()
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Edit Product',
      leadingIcon: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          verticalSpaceMedium,
          InkWell(
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
            },
            child: AppCard(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.teal,
                )),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Name',
            hintText: 'Product Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // controller: controller.emailController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Category',
            hintText: 'Product Category',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // controller: controller.emailController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Price',
            hintText: 'Product Price',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            // controller: controller.emailController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Stock',
            hintText: 'Product Stock',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            // controller: controller.emailController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Product Description',
            hintText: 'Product Description',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            // controller: controller.emailController,
          ),
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(btnText: 'Save Changes', onPressed: () {Get.back();}),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}