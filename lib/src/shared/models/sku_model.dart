class SkuModel {
  final int skuId;
  final String name;
  final String description;
  final double price;
  final double sellingPrice;
  final List<String?> images;

  SkuModel({
    required this.skuId,
    required this.name,
    required this.description,
    required this.price,
    required this.sellingPrice,
    required this.images,
  });

  factory SkuModel.fromJson(Map<String, dynamic> json) {
    List<String?>? imagesJson = json['images'];
    List<String?> images = imagesJson != null ? imagesJson.cast<String?>() : [];

    return SkuModel(
      skuId: json['skuId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      sellingPrice: json['sellingPrice'],
      images: images,
    );
  }
}