import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class ViewStaffController extends BaseController {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  Future<void> deleteStaff(String email)async{

    await _firebaseFirestore.collection("Staff").doc(email).delete();
    Get.back();
    Get.snackbar("Status", "Staff Member Deleted");
  }
}