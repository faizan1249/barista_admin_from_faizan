import 'package:get/get.dart';

import 'edit_category_controller.dart';

class EditCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCategoryController());
  }

}