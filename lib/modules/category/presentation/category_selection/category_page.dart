import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/nav_drawer/left_nav_drawer.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/modules/category/data/category_model.dart';

import 'package:barista/modules/loader/full_screen_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      // body: _buildBody(),
      body: CategoryInformation(context),
      drawer: NavDrawer(),
      floatingActionButton: _buildAddCategoryButton(),
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Category',
      leadingIcon: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget CategoryInformation(BuildContext context) {
    final Stream<QuerySnapshot> _categoriesStream =
    FirebaseFirestore.instance.collection("Categories").snapshots();

    return StreamBuilder(
        stream: _categoriesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return FullScreenLoader();
          }
          return Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                CategoryModel categoryModel = CategoryModel.fromMap(data);
                return Column(
                  children: [
                    verticalSpaceRegular,
                    InkWell(
                      onTap: () {
                        controller.onSingleCategoryPressed(categoryModel, document.id);
                      },
                      child: AppCard(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100,
                                color: Colors.teal,
                              ),
                            ),
                            horizontalSpaceSmall,
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.headingThree(categoryModel.categoryName),
                                  verticalSpaceTiny,
                                  AppText.body('Type: ${categoryModel.categoryType}'),
                                  verticalSpaceTiny,
                                  AppText.body(categoryModel.description),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList());
        });
  }

  Widget _buildBody() {
    return Column(
      children: [
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceRegular,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewCategory),
          child: AppCard(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingThree('Raw Beans'),
                      verticalSpaceTiny,
                      AppText.body('Type: Beans'),
                      verticalSpaceTiny,
                      AppText.body('Description: Refined beans for coffee'),
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

  Widget _buildAddCategoryButton() {
    return FloatingActionButton.small(
        child: Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.addCategory));
  }
}
