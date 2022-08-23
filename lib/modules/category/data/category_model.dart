import 'dart:convert';

/// categoryName : "Category"
/// categoryType : "Category Type"
/// description : "Description"
///

CategoryModel categoryModelFromMap(String str) =>
    CategoryModel.fromMap(json.decode(str));
String categoryModelToMap(CategoryModel data) => json.encode(data.toMap());

class CategoryModel {
  CategoryModel({
    this.categoryName,
    this.categoryType,
    this.description,
  });

  CategoryModel.fromMap(dynamic json) {
    categoryName = json['categoryName'];
    categoryType = json['categoryType'];
    description = json['description'];
  }
  String? categoryName;
  String? categoryType;
  String? description;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['categoryName'] = categoryName;
    map['categoryType'] = categoryType;
    map['description'] = description;
    return map;
  }
}
