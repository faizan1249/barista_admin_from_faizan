import 'package:barista/modules/category/presentation/add_category/add_category_controller.dart';
import 'package:get/get.dart';

class AddCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCategoryController());
  }

}