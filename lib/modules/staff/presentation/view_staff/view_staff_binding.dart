import 'package:barista/modules/staff/presentation/view_staff/view_staff_controller.dart';
import 'package:get/get.dart';

class ViewStaffBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViewStaffController());
  }

}