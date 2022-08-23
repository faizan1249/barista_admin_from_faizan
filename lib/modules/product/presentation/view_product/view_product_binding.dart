import 'package:barista/modules/product/presentation/view_product/view_product_controller.dart';
import 'package:get/get.dart';

class ViewProductBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViewProductController());
  }

}