import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/nav_drawer/left_nav_drawer.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/modules/staff/presentation/staff_selection/staff_controller.dart';
import 'package:barista/singleton/singletonConsts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffPage extends GetView<StaffController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      // body: _buildBody(),
      body: UserInformation(context),
      drawer: NavDrawer(),
      floatingActionButton: _buildAddStaffButton(),
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Staff',
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

  Widget UserInformation(BuildContext context) {
    final Stream<QuerySnapshot> _staffStream =
    FirebaseFirestore.instance.collection('Staff').snapshots();

    return StreamBuilder(
      stream: _staffStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Text("Loading");
        // }
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
            document.data()! as Map<String, dynamic>;
            //  return Text(data['fname'] +" "+data['lname']);

            return Column(
              children: [
                verticalSpaceMedium,
                InkWell(
                  onTap: () {
                    print(data['fname'] + " " + data['lname']);
                    print(data);
                    Singleton.StaffData = data;
                    Get.toNamed(Routes.viewStaff);
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
                              AppText.headingThree(
                                  data['fname'] + " " + data['lname']),
                              verticalSpaceTiny,
                              AppText.body(data['email']),
                              verticalSpaceTiny,
                              AppText.body('Age: ' + data['age'].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpaceMedium,
        InkWell(
          onTap: () => Get.toNamed(Routes.viewStaff),
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
                      AppText.headingThree('Michel Jhon'),
                      verticalSpaceTiny,
                      AppText.body('micheljhon99@gmail.com'),
                      verticalSpaceTiny,
                      AppText.body('Age: 34'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddStaffButton() {
    return FloatingActionButton.small(
        child: Icon(Icons.add), onPressed: () => Get.toNamed(Routes.addStaff));
  }
}
