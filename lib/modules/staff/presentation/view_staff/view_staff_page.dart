import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text_viewer/app_text_viewer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/staff/presentation/view_staff/view_staff_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../singleton/singletonConsts.dart';

class ViewStaffPage extends GetView<ViewStaffController> {
  // Map<String,dynamic> bodyData;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(appBar: _buildTopBar(), body: _buildBody());
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'View Staff',
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
          title: 'Staff First Name',
          value: '${Singleton.StaffData!['fname']}',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Staff Last Name',
          value: '${Singleton.StaffData!['lname']}',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Email',
          value: '${Singleton.StaffData!['email']}',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Age',
          value: '${Singleton.StaffData!['age']}',
        ),
        verticalSpaceRegular,
        AppTextViewer(
          title: 'Phone',
          value: '${Singleton.StaffData!['phone_number']}',
        ),
        verticalSpaceLarge,
        RowExpanded(
          child: AppFilledButton(
              btnText: 'Edit Staff',
              onPressed: () => Get.toNamed(Routes.editStaff)),
        ),
        verticalSpaceMedium,
        RowExpanded(
          child: AppFilledButton(
              btnText: 'Delete Staff',
              onPressed: () async {
                await controller.deleteStaff(Singleton.StaffData!['email']);
                // Get.back();

                //  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
              }),
        ),
        verticalSpaceMedium,
      ],
    );
  }
}
