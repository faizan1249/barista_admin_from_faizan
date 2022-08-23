import 'package:barista/modules/category/data/category_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() => _singleton;

  Singleton._internal();

  static Map<String, dynamic>? StaffData;
  static Map<String, dynamic>? CategoryData;
  static var DocumentID;

  static CategoryModel? currentCategoryModel;

}

main() {}
