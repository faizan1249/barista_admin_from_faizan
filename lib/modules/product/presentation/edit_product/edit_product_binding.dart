import 'package:barista/modules/product/presentation/edit_product/edit_product_controller.dart';
import 'package:get/get.dart';

class EditProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProductController());
  }

}