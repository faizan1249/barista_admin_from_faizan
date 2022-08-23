import 'package:barista/modules/staff/presentation/staff_selection/staff_controller.dart';
import 'package:get/get.dart';

class StaffBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StaffController());
  }

}