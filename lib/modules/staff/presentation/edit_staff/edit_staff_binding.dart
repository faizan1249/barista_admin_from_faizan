import 'package:barista/modules/staff/presentation/edit_staff/edit_staff_controller.dart';
import 'package:get/get.dart';

class EditStaffBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditStaffController());
  }

}