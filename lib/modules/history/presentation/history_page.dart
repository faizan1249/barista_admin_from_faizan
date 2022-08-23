import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/nav_drawer/left_nav_drawer.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/history/presentation/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody(),
      drawer: NavDrawer(),
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'History',
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
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                  child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        AppCard(
          child: Column(
            children: [
              RowExpanded(
                child: AppText.body('Michel Jhon sold 2 large cup of Cappuccino Coffee'),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.caption('Jun 28, 2022'),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceMedium,
      ],
    );
  }

}