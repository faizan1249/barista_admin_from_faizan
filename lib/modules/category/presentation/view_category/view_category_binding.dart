import 'package:barista/modules/category/presentation/view_category/view_category_controller.dart';
import 'package:get/get.dart';

class ViewCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewCategoryController());
  }

}