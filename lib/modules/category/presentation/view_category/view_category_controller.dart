import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../core/routings/app_route.dart';

class ViewCategoryController extends BaseController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> deleteCategory(var DocumentID) async {
    _firebaseFirestore.collection("Categories").doc(DocumentID).delete();
    Get.back();
    Get.snackbar("Status", "Category deleted successfully");
  }

  void onEditCategoryPressed() {
    Get.toNamed(Routes.editCategory);
  }

}
