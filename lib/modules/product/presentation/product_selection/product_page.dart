import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/nav_drawer/left_nav_drawer.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/modules/product/presentation/product_selection/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody(),
      drawer: NavDrawer(),
      floatingActionButton: _buildAddProductButton(),
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Product',
      leadingIcon: Row(
        children: [
          Builder(
            builder: (context) =>
                IconButton(
                  icon: Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100, color: Colors.teal,),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.headingThree('Cappuccino Beans'),
                        verticalSpaceTiny,
                        AppText.body('Price: \$214'),
                        verticalSpaceTiny,
                        AppText.body('Quantity: 124 Units'),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100, color: Colors.teal,),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Cappuccino Beans'),
                      verticalSpaceTiny,
                      AppText.body('Price: \$214'),
                      verticalSpaceTiny,
                      AppText.body('Quantity: 124 Units'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100, color: Colors.teal,),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Cappuccino Beans'),
                      verticalSpaceTiny,
                      AppText.body('Price: \$214'),
                      verticalSpaceTiny,
                      AppText.body('Quantity: 124 Units'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100, color: Colors.teal,),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Cappuccino Beans'),
                      verticalSpaceTiny,
                      AppText.body('Price: \$214'),
                      verticalSpaceTiny,
                      AppText.body('Quantity: 124 Units'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100, color: Colors.teal,),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Cappuccino Beans'),
                      verticalSpaceTiny,
                      AppText.body('Price: \$214'),
                      verticalSpaceTiny,
                      AppText.body('Quantity: 124 Units'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewProduct),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100, color: Colors.teal,),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Cappuccino Beans'),
                      verticalSpaceTiny,
                      AppText.body('Price: \$214'),
                      verticalSpaceTiny,
                      AppText.body('Quantity: 124 Units'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildAddProductButton() {
    return FloatingActionButton.small(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.addProduct)
    );
  }
}