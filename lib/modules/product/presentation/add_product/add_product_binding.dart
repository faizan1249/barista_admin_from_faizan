import 'package:barista/modules/product/presentation/add_product/add_product_controller.dart';
import 'package:get/get.dart';

class AddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}
