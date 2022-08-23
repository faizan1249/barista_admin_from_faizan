import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/shared_preference/app_shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 150,
              color: kcPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/branding/logo.jpg', height: 80,)],
              )),
          ListTile(
            leading: Icon(Icons.dashboard_rounded),
            title: Text('Dashboard'),
            onTap: () => Get.toNamed(Routes.dashboard),
          ),
          ListTile(
            leading: Icon(Icons.account_tree_rounded),
            title: Text('Products'),
            onTap: () => Get.toNamed(Routes.product),
          ),
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: Text('Categories'),
            onTap: () => Get.toNamed(Routes.category),
          ),
          ListTile(
            leading: Icon(Icons.people_rounded),
            title: Text('Staffs'),
            onTap: () => Get.toNamed(Routes.staff),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () => Get.toNamed(Routes.history),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              AppSharedPreferences.setUserLoggedInStatus(false);
              Get.offAllNamed(Routes.login);
            }
          ),
        ],
      ),
    );
  }
}

class LeftNavMenuItem extends StatelessWidget {
  const LeftNavMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.input),
      title: Text('Welcome'),
      onTap: () => {},
    );
  }
}
