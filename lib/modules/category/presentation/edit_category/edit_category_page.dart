import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/category/presentation/edit_category/edit_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryPage extends GetView<EditCategoryController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody()
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Edit Category',
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
            title: 'Category Name',
            hintText: 'Enter category name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.categoryNameController,
            validator: ValidationBuilder()
                .required('This field is required')
                .build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Category Type',
            hintText: 'Enter category type',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.categoryTypeController,
            validator: ValidationBuilder()
                .required('This field is required')
                .build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Description',
            hintText: 'Enter Description',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: controller.categoryDescriptionController,
          ),
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(btnText: 'Save Changes', onPressed: () => controller.updateCategory()),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}