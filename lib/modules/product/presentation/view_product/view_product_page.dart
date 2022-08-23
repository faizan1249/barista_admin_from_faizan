import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text_viewer/app_text_viewer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/product/presentation/view_product/view_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProductPage extends GetView<ViewProductController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody()
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'View Product',
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
          title: 'Product Name',
          value: '',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Product Category',
          value: '',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Product Price',
          value: '',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Product Stock',
          value: '',
        ),verticalSpaceRegular,
        AppTextViewer(
          title: 'Product Description',
          value: '',
        ),
        verticalSpaceLarge,
        RowExpanded(
          child: AppFilledButton(btnText: 'Edit Product', onPressed: () => Get.toNamed(Routes.editProduct)),
        ),
        verticalSpaceMedium,
        RowExpanded(
          child: AppFilledButton(btnText: 'Delete Product', onPressed: () {Get.back();}),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}