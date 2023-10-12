import 'package:ecommerce_app/src/shared/models/sku_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final List<SkuModel?> skus;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.skus,
  });

  String? get image {
    if (skus.isNotEmpty) {
      return skus.first!.images.first;
    }

    return null;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? skuJsonList = json['skus'];
    List<SkuModel> skus = skuJsonList != null
      ? skuJsonList.map<SkuModel>((sku) => SkuModel.fromJson(sku as Map<String, dynamic>)).toList()
      : [];

    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      skus: skus,
    );
  }
}