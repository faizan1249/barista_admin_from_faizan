import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/text_viewer/app_text_viewer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/category/presentation/view_category/view_category_controller.dart';
import 'package:barista/singleton/singletonConsts.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ViewCategoryPage extends GetView<ViewCategoryController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(appBar: _buildTopBar(), body: _buildBody());
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'View Category',
      leadingIcon: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        verticalSpaceMedium,
        AppCard(
            child: Container(
              width: 150,
              height: 150,
              color: Colors.teal,
            )),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Category Name',
          value: Singleton.currentCategoryModel!.categoryName,
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Category Type',
          value: Singleton.currentCategoryModel!.categoryType,
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Description',
          value: Singleton.currentCategoryModel!.description,
        ),
        verticalSpaceLarge,
        RowExpanded(
          child: AppFilledButton(
              btnText: 'Edit Category',
              onPressed: () => controller.onEditCategoryPressed()),
        ),
        verticalSpaceMedium,
        RowExpanded(
          child: AppFilledButton(
              btnText: 'Delete Category',
              onPressed: () async {
                await controller.deleteCategory(Singleton.DocumentID);
                // Get.back();
              }),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
