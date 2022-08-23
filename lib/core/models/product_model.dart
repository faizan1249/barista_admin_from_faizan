import 'dart:convert';

/// pName : "Coffee"
/// pCategory : "Coffee"
/// pStock : "300"
/// pDescription : "Coffee"
// [{"cupPrice":"","cupSize":"","cupWeight":""},{"cupPrice":"","cupSize":"","cupWeight":""},{"cupPrice":"","cupSize":"","cupWeight":""}]

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));
String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  ProductModel({
    this.pName,
    this.pCategory,
    this.pStock,
    this.pDescription,
    this.pSizes,
  });

  ProductModel.fromMap(dynamic json) {
    pName = json['pName'];
    pCategory = json['pCategory'];
    pStock = json['pStock'];
    pDescription = json['pDescription'];
    if (json['pSizes'] != null) {
      pSizes = [];
      json['pSizes'].forEach((v) {
        pSizes?.add(PSizes.fromMap(v));
      });
    }
  }

  String? pName;
  String? pCategory;
  String? pStock;
  String? pDescription;
  List<PSizes>? pSizes;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['pName'] = pName;
    map['pCategory'] = pCategory;
    map['pStock'] = pStock;
    map['pDescription'] = pDescription;
    if (pSizes != null) {
      map['pSizes'] = pSizes?.map((v) => v.toMap()).toList();
    }
    return map;
  }
}

/// cupPrice : ""
/// cupSize : ""
/// cupWeight : ""

PSizes pSizesFromMap(String str) => PSizes.fromMap(json.decode(str));
String pSizesToMap(PSizes data) => json.encode(data.toMap());

class PSizes {
  PSizes({
    this.cupPrice,
    this.cupSize,
    this.cupWeight,
  });

  PSizes.fromMap(dynamic json) {
    cupPrice = json['cupPrice'];
    cupSize = json['cupSize'];
    cupWeight = json['cupWeight'];
  }
  String? cupPrice;
  String? cupSize;
  String? cupWeight;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['cupPrice'] = cupPrice;
    map['cupSize'] = cupSize;
    map['cupWeight'] = cupWeight;
    return map;
  }
}
