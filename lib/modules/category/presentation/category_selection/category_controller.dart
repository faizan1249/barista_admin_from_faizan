import 'package:barista/core/widgets/base/base_controller.dart';
import 'package:barista/modules/category/data/category_model.dart';
import 'package:barista/singleton/singletonConsts.dart';
import 'package:get/get.dart';
import '../../../../core/routings/app_route.dart';

class CategoryController extends BaseController {

  @override
  void onInit() {
    super.onInit();
  }

  void onSingleCategoryPressed(CategoryModel categoryModel, String docId) {
    Singleton.DocumentID = docId;
    Singleton.currentCategoryModel = categoryModel;
    Get.toNamed(Routes.viewCategory);
  }

}