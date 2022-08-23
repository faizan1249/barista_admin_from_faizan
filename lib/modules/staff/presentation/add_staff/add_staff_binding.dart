import 'package:barista/modules/staff/presentation/add_staff/add_staff_controller.dart';
import 'package:get/get.dart';

class AddStaffBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddStaffController());
  }

}