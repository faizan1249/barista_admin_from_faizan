import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/nav_drawer/left_nav_drawer.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/dashboard/presentation/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
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
      title: 'Dashboard',
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        AppText.subheading('Today Stats', color: kcPrimaryColor,),
        verticalSpaceSmall,
        RowExpanded(
          child: AppCard(
            bgColor: kcDashboard1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.body('Today Sale', color: kcWhiteColor,),
                verticalSpaceTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.payments_outlined, color: kcWhiteColor, size: 36,),
                    AppText.headingTwo('\$24562', color: kcWhiteColor,),
                  ],
                ),
              ],
            )),
        ),
        verticalSpaceMedium,
        RowExpanded(
          child: AppCard(
              bgColor: kcDashboard2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body('Today Revenue', color: kcWhiteColor,),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.payments_outlined, color: kcWhiteColor, size: 36,),
                      AppText.headingTwo('\$24562', color: kcWhiteColor,),
                    ],
                  ),
                ],
              )),
        ),
        verticalSpaceLarge,
        AppText.subheading('Monthly Stats', color: kcPrimaryColor,),
        verticalSpaceSmall,
        RowExpanded(
          child: AppCard(
              bgColor: kcDashboard3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body('Monthly Sale', color: kcWhiteColor,),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.payments_outlined, color: kcWhiteColor, size: 36,),
                      AppText.headingTwo('\$24562', color: kcWhiteColor,),
                    ],
                  ),
                ],
              )),
        ),
        verticalSpaceMedium,
        RowExpanded(
          child: AppCard(
              bgColor: kcDashboard4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body('Monthly Revenue', color: kcWhiteColor,),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.payments_outlined, color: kcWhiteColor, size: 36,),
                      AppText.headingTwo('\$24562', color: kcWhiteColor,),
                    ],
                  ),
                ],
              )),
        ),
        verticalSpaceMedium,
      ],
    );
  }

}