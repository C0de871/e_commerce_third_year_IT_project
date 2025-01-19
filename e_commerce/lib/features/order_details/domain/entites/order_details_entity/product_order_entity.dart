import 'package:collection/collection.dart';

class ProductOrderEntity {
  int? storeId;
  String? storeName;
  int? productId;
  String? productName;
  int? categoryId;
  String? categoryName;
  double? price;
  int? quantity;
  String? description;
  int? isFavorite;
  String? mainImage;

  ProductOrderEntity({
    this.storeId,
    this.storeName,
    this.productId,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.price,
    this.quantity,
    this.description,
    this.isFavorite,
    this.mainImage,
  });
}
